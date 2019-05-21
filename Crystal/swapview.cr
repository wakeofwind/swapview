require "./common.cr"

module SwapView
  def get_swap
    result = [] of Tuple(Int32, Int32, String | Nil)
    Dir.entries("/proc").each do |entry|
      pid = entry.to_i?
      if pid
        swap_info = get_swap_for(pid)
        if swap_info[1] > 0
          result << swap_info
        end
      end
    end
    result.sort_by! {|x| x[1] }
    result
  end

  def main
    results = get_swap
    report(results)
  end
end

SwapView.main
