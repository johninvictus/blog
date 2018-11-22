defmodule BlogWeb.Schema do
  use Absinthe.Schema
  import_types(BlogWeb.Schema.Types)

  query do
    field :posts, list_of(:post) do
      resolve(&Blog.Blog.PostResolver.all/2)
    end

    field :post, type: :post do
      arg(:id, non_null(:id))
      resolve(&Blog.Blog.PostResolver.find/2)
    end

    mutation do
      field :create_post, type: :post do
        arg(:title, non_null(:string))
        arg(:body, non_null(:string))
        arg(:tags, non_null(:string))

        resolve(&Blog.Blog.PostResolver.create/2)
      end
    end
  end
end
