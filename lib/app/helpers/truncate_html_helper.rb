module TruncateHtmlHelper

  def truncate_html(html, options={})
    return '' if html.nil?
    html_string = TruncateHtml::HtmlString.new(html)
    TruncateHtml::HtmlTruncator.new(html_string, options).truncate.html_safe
  end

  def slice_html(html, options={})
    return ['', ''] if html.nil?
    html_string = TruncateHtml::HtmlString.new(html)
    truncator = TruncateHtml::HtmlTruncator.new(html_string, options)
    first_part = truncator.truncate.html_safe
    second_part = html_string.html_tokens.
      slice(truncator.truncated_html.length-1, html_string.length).join.html_safe
    [first_part, second_part]
  end

end
