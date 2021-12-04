defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order
  alias Exlivery.Orders.Item

  def create(file_name \\ "report.csv") do
    order_list = build_order_list()

    File.write("reports/#{file_name}", order_list)
  end

  defp build_order_list() do
    OrderAgent.index_orders()
    |> Map.values()
    |> Enum.map(fn order -> order_to_string(order) end)
  end

  defp order_to_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string = Enum.map(items, fn item -> item(item) end)

    "#{cpf},#{items_string},#{total_price}\n"
  end

  defp item(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price}\n"
  end
end
