defmodule DesafioTaekWeb.WelcomeController do
  use DesafioTaekWeb, :controller

  def index(conn, _params) do
    text(conn, 'Welcome to the Rocketpay API')
  end
end
