defmodule PhoenixKnowHowWeb.LinkLive.Index do
  use PhoenixKnowHowWeb, :live_view

  alias PhoenixKnowHow.Links

  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id
    socket =
      socket
      |> assign(:links, Links.list_links(user_id))

    {:ok, socket}
  end
end
