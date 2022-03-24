defmodule DesafioTaekWeb.GitRepositoryController do
  use DesafioTaekWeb, :controller

  def index(conn, _params) do
    Tentacat.Repositories.list_orgs("takenet")
    |> handle_response()
    |> return_response(conn)
  end

  def handle_response({status, data, _response}) when status != 200, do: {:erro, %{response: data, status: status}} 
  def handle_response({200, result, _response}), do: {:ok, result}

  def return_response({:ok, result}, conn), do: json(conn, process_response([], result))
  def return_response({:erro, response}, conn), do: json(conn, response)

  def process_response(repo, response) when response == [], do: repo
  def process_response(repo, [head|tail]) when length(repo) == 5 do
    %{ status: 200, avatar: head["owner"]["avatar_url"], repository: repo }
  end
  def process_response(repo, [head|tail]) do
    if head["language"] == "C#" do
      List.insert_at(repo, length(repo), %{
        name: head["name"],
        desc: head["description"],
        language: head["language"],
        date: head["created_at"]
      })
      |> process_response(tail)
    else
      process_response(repo, tail)
    end
  end
end