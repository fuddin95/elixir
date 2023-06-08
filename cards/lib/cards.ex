defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    "hi there!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    cards =
      for suit <- suits do
        for value <- values do
          "#{value} of #{suit}"
        end
      end

    List.flatten(cards)
  end

  # Better way to do it
  def create_deck_2 do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file doesn't exist"
    end
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck_2()
    # deck = Cards.shuffle(deck)
    # Cards.deal(deck, hand_size)

    Cards.create_deck_2() |> Cards.shuffle() |> Cards.deal(hand_size)
  end
end
