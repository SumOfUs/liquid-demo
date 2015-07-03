module CampaignData
  extend self

  @@data = {
    'media' => {
      'type' => 'image',
      'src' => 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Hausziege_04.jpg'
    },
    'body' => {
      'title' => "TAKE ACTION: Time Warner Cable is using our cable dollars to undermine our democracy and our Internet .",
      'description' => "Time Warner Cable is using our cable dollars to undermine our democracy and our Internet through a network of shadowy interest groups. It is pushing an agenda that would roll back net neutrality, and loosen protections of our private information."
    },
    'signatures' => {
      'count' => '432432'
    }
  }

  def campaign
    @@data
  end
end

class DemoController < ApplicationController
  def show
    @content = (render_to_string partial: 'demo/sample')
    @rendered_content = liquid(@content)
  end

  def create
    @content = params[:content]

    @rendered_content = liquid(params[:content])
    render :show
  end

  private

  def liquid(content)
    @rendered_content = Liquid::Template.parse(content,  error_mode: :strict).render('campaign' => CampaignData.campaign).html_safe
  end
end
