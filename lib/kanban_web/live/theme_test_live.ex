defmodule KanbanWeb.ThemeTestLive do
  use KanbanWeb, :live_view
  import Phoenix.HTML.Form

  def mount(_params, _session, socket) do
    # Create a form using a basic map with Phoenix.Component.to_form/1
    form = to_form(%{"text" => "", "select" => "", "checkbox" => false, "textarea" => ""})
    
    {:ok, assign(socket, 
      page_title: "Theme Test",
      form: form
    )}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4 py-8">
      <.header class="mb-8">
        Theme Test Page
        <:subtitle>Test different UI components in light and dark modes</:subtitle>
        <:actions>
          <.theme_toggle />
        </:actions>
      </.header>

      <div class="space-y-8">
        <!-- Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="p-6 rounded-lg border border-zinc-200 dark:border-zinc-700 bg-white dark:bg-zinc-800">
            <h3 class="text-lg font-semibold text-zinc-900 dark:text-white">Card Example</h3>
            <p class="mt-2 text-zinc-600 dark:text-zinc-300">
              This card demonstrates background and text color transitions between themes.
            </p>
          </div>

          <div class="p-6 rounded-lg bg-zinc-50 dark:bg-zinc-900">
            <h3 class="text-lg font-semibold text-zinc-900 dark:text-white">Alternative Card</h3>
            <p class="mt-2 text-zinc-600 dark:text-zinc-300">
              A different style card with subtle background.
            </p>
          </div>
        </div>

        <!-- Buttons -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-zinc-900 dark:text-white">Buttons</h3>
          <div class="space-x-4">
            <.button>Primary Button</.button>
            <.button class="bg-zinc-100 text-zinc-900 hover:bg-zinc-200 dark:bg-zinc-700 dark:text-white dark:hover:bg-zinc-600">
              Secondary Button
            </.button>
          </div>
        </div>

        <!-- Form Elements -->
        <div class="max-w-md">
          <h3 class="text-lg font-semibold text-zinc-900 dark:text-white mb-4">Form Elements</h3>
          <.simple_form for={@form} phx-submit="ignore">
            <.input field={@form[:text]} type="text" label="Text Input" />
            <.input field={@form[:select]} type="select" label="Select Input" options={["Option 1", "Option 2"]} />
            <.input field={@form[:checkbox]} type="checkbox" label="Checkbox Input" />
            <.input field={@form[:textarea]} type="textarea" label="Textarea Input" />
          </.simple_form>
        </div>

        <!-- Table -->
        <div>
          <h3 class="text-lg font-semibold text-zinc-900 dark:text-white mb-4">Table Example</h3>
          <.table
            id="theme-test-table"
            rows={[
              %{id: 1, name: "Item 1", status: "Active"},
              %{id: 2, name: "Item 2", status: "Inactive"}
            ]}
          >
            <:col :let={item} label="ID"><%= item.id %></:col>
            <:col :let={item} label="Name"><%= item.name %></:col>
            <:col :let={item} label="Status"><%= item.status %></:col>
          </.table>
        </div>

        <!-- Flash Messages -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-zinc-900 dark:text-white mb-4">Flash Messages</h3>
          <.flash kind={:info} flash={%{}} id="test-info">
            This is an info message
          </.flash>
          <.flash kind={:error} flash={%{}} id="test-error">
            This is an error message
          </.flash>
        </div>
      </div>
    </div>
    """
  end

  # Add a handler for the ignore submit event
  def handle_event("ignore", _params, socket) do
    {:noreply, socket}
  end
end 