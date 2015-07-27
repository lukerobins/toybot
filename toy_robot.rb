require './lib/toy_robot'

controller = Controller.new Tabletop.new(5,5), Robot.new

$stdin.each_line do |line|
  case line
  when /\s*MOVE\s*/
    controller.move
  when /\s*LEFT\s*/
    controller.left
  when /\s*RIGHT\s*/
    controller.right
  when /\s*REPORT\s*/
    puts controller.report
  when /\s*PLACE (\d),(\d),(\w{4,5})\s*/
    matchdata = Regexp.last_match
    controller.place matchdata[1].to_i, matchdata[2].to_i, matchdata[3].capitalize.to_sym
  else
    puts 'Sorry Robot did not understand your command'
  end
end
