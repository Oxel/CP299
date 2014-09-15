class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
    mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order(:title) }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  validates :image, presence: true

  private

  def render_as_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  end

  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown body
  end

end
