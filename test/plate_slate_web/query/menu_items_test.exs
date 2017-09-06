defmodule PlateSlateWeb.Query.MenuItemsTest do
  use PlateSlateWeb.ConnCase

  setup do
    # should really use a factory instead
    Code.eval_file("priv/repo/seeds.exs")
    :ok
  end

  test "list menu items without filter" do
    query = """
    {
      menuItems { name }
    }
    """

    conn = get build_conn(), "/", query: query

    assert %{"data" => %{ "menuItems" => [ item |_]}} = json_response(conn, 200)
    assert item == %{ "name" => "Rueben" }
  end

  test "list menu items without filter via post" do
    query = """
    {
      menuItems { name }
    }
    """

    conn =
      build_conn()
      |> Plug.Conn.put_req_header("content-type", "application/json")
      |> post("/", %{"query" => query})

    assert %{"data" => %{ "menuItems" => [ item |_]}} = json_response(conn, 200)
    assert item == %{ "name" => "Rueben" }
  end

  #  test "list menu items with filter" do
  #    query = """
  #    {
  #      menuItems(matching: "R") { name }
  #    }
  #    """
  #
  #    payload = %{"query" => query}
  #  end
end
