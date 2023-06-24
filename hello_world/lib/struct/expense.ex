defmodule HelloWorld.Struct.Expense do
  alias HelloWorld.Struct.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }
@spec sample :: [t()]
  def sample do [
    %Expense{
      title: "Groceries",
      date: Date.utc_today(),
      amount: 100.00,
      store: "Metro"
    },
    %Expense{
      title: "Mobile",
      date: Date.utc_today(),
      amount: 780.0,
      store: "Metro"
    },
    %Expense{
      title: "car",
      date: Date.utc_today(),
      amount: 30.0,
      store: "shell"
    }
  ]
end
@spec total([t()]) :: number()
  def total(expenses) do
    expenses |>
    Enum.reduce( 0, fn expense, acc -> expense.amount + acc end)
  end

@spec sort_by_date([t()]) :: [t()]
 def sort_by_date(expense)do
  expense |> Enum.sort_by(& &1.date)
 end

 @spec add_expense(t()) :: [t()]
 def add_expense(%Expense{} = expense) do
  [expense | sample()]
 end

 def update_amount(title, amount) do
  # filter the expense
  [item] = Enum.filter(sample(), fn%{title: extracted_title} -> extracted_title == title end)
  # Enum.filter(sample(), fn expense -> expense.title == title end)

  # update the amount
  new_item = %{item | amount: amount}

  #  remove and return the list
  [new_item | sample() |> List.delete(item)]

end

# ___________________ WITH _______________________

# Login -> authenticate, verify, authorize

@users ["user1", "user2", "user3"]

def authenticate(user) when user in @users, do: {:ok, "authorized"}
def authenticate(_), do: {:error, "unauthorized"}

def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
def verify_password(_user, _password), do: {:ok, "wrong password"}

def login(user, password) do
    with {:ok, _auth_msg} <- authenticate(user),
  {:ok, _auth_msg} <- verify_password(user,password) do
    {:ok, "#{user} is logged in"}
    else
    {:error, msg} -> {:error, msg}
    _ -> {:unathorized, "unauthorized"}
    end
  end
end
