defmodule AfileClient do
  def ls(server) do
    send server, {self, :list_dir}
    receive do
      {^server, {:ok, filelist}} -> filelist
    end
  end

  def get_file(server, file) do
    send server, {self, {:get_file, file}}
    receive do
      {^server, {:ok, content}} ->  content
    end
  end

end
