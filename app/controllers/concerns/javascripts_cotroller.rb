class JavascriptsController < ApplicationController
  def dinamic_groups
    @groups=Group.all
end