defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  import Exlivery.Factory

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        {:ok,
         "123,pizza,1,35.5\npizza,1,35.5\n,71.00" <>
           "\n123,pizza,1,35.5\npizza,1,35.5\n,71.00\n"}

      Report.create("report_test.csv")

      response = File.read("reports/report_test.csv")

      assert response == expected_response
    end
  end
end
