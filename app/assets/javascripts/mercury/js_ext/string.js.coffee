String::teaser = (wordCount = 20, maxWordLength = 8) ->
  teaser = new String(this)
  actualWordCount = teaser.match(new RegExp("[^\\s]+\\s?", "g")).length
  wordCount = if actualWordCount < wordCount then actualWordCount else wordCount
  # remove extra whitespace
  teaser = teaser.replace(new RegExp("\\s+", "g"), " ")
  # remove leading and trailing whitespace
  teaser = teaser.trim()
  # save only wordCount words
  snippets = teaser.match(new RegExp("([^\\s]+\\s?){1,#{wordCount}}", "g"))
  # add ellipsis if words were removed
  if snippets[0].split(" ").length < actualWordCount
    teaser = snippets[0] + "..."
  # truncate if too long
  maxLength = wordCount * maxWordLength
  if teaser.length > maxLength
    teaser = teaser.substring(0, maxLength) + "..."
  teaser
