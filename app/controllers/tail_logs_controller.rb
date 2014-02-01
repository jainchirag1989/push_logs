class TailLogsController < ApplicationController
  def logs
    off = params["offset"]
    f = File.open('log/sample.log', "r")
    @logs = [*f][off.to_i - 1]
    new_offset = f.readlines.size
    f.close
    render :json => {"data" => @logs, "offset" => new_offset}
  end
end