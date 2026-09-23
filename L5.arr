use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun choose-hat(temp :: Number) -> String:
  doc:"returns a message with temp-approprite headgear"
# #   spy:
# #     temp
#   end
  if temp > 60: "sun hat"
  else if temp > 32: "no hat" 
  else: "winter hat" 
  end
where: 
  choose-hat(70) is "sun hat"
  choose-hat(32.1) is "no hat"
  choose-hat(32) is "winter hat"
end
fun add-glasses(outfit :: String) -> String: 
  doc: "add glasses to outfits"
  outfit + " and glasses"
end
fun choose-outfit(temp :: Number) -> String: add-glasses(choose-hat(temp))
end