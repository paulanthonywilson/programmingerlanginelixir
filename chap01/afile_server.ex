defmodule AfileServer do
  def start(dir) do
    spawn(AfileServer, :loop, [dir])
  end

  def loop(dir) do
    receive do
      {client, :list_dir} -> 
        send client, {self, File.ls(dir)}
      {client, {:get_file, file}} -> 
        send client, {self, File.read("#{dir}/#{file}")}
    end
    loop(dir)
  end
end
