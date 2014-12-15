class NewsMailer < ActionMailer::Base
  default to: Proc.new{User.pluck(:email)}
  default from: "rkeblitis@gmail.com"

  def news_update(post_id)
    @news = Post.find(post_id)
    #User.all.each do |user|
      mail(
          subject: "Moar News for ",
          body: "#{@news.title}\n read more: \n http://localhost:3000/posts/#{@news.id}"
          )

    Resque.enqueue(EmailJob, @news)
    #end


  end



end