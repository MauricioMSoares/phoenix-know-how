defmodule PhoenixKnowHowWeb.LinkLive.IndexNew do
  use PhoenixKnowHowWeb, :live_view

  alias PhoenixKnowHow.Links

  def mount(_params, _session, socket) do
    changeset = Links.Link.changeset(%Links.Link{})

    socket =
      socket
      |> assign(
        :form,
        to_form(changeset)
      )

    {:ok, socket}
  end
end
