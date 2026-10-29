target triple = "nvptx64-nvidia-cuda"
declare i32 @active_mask() convergent nounwind readnone
define i32 @test(i1 %cond, i32 %x) {
entry:
  br i1 %cond, label %left, label %right
left:
  %a = call i32 @active_mask()
  %b = add i32 %a, %x
  br label %done
right:
  %c = call i32 @active_mask()
  %d = sub i32 %c, %x
  br label %done
done:
  %v = phi i32 [%b, %left], [%d, %right]
  ret i32 %v
}
