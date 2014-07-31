class BlogPage
  include PageObject

  page_url FigNewton.blog_url
  h1(:title, :class=> 'title')
end