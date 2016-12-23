class Todo
  constructor: (item) ->
    @item = $(item)
    @id = @item.data("id")
    @setEvents()

  setEvents: ->
    @item.children("input[type='checkbox']").on "click", @handleToggle

  handleToggle: =>
    $.ajax(
      url: "/todos/#{id}/complete",
      method: "PATCH"
      dataType: "JSON"
      success: (data) =>
        if data.completed
          $(this).next().html "<del>#{data.description}</del>"
        else
          $(this).next().html data.description
    )

jQuery ->
  todos = $.map $("li"), (item, i) ->
    new Todo(item)

  # $("input[type='checkbox']").on "click", (e) ->
  #   id = $(this).data("id")
  #
  #   $.ajax(
  #     url: "/todos/#{id}/complete",
  #     method: "PATCH"
  #     dataType: "JSON"
  #     success: (data) =>
  #       if data.completed
  #         $(this).next().html "<del>#{data.description}</del>"
  #       else
  #         $(this).next().html data.description
  #   )
