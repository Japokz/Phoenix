defmodule Blog.BlogManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.BlogManager` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blog.BlogManager.create_post()

    post
  end
end
