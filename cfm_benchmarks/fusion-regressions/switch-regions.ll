target triple = "nvptx64-nvidia-cuda"
define void @test(i1 %left, i32 %n, float %x, float* %out) {
entry:
  br i1 %left, label %L, label %R
L:
  switch i32 %n, label %end [ i32 1, label %L1 i32 2, label %L2 ]
L1:
  %a = fadd float %x, 1.0
  store float %a, float* %out
  br label %end
L2:
  %b = fmul float %x, 2.0
  store float %b, float* %out
  br label %end
R:
  switch i32 %n, label %end [ i32 1, label %R1 i32 2, label %R2 ]
R1:
  %c = fadd float %x, 3.0
  store float %c, float* %out
  br label %end
R2:
  %d = fmul float %x, 4.0
  store float %d, float* %out
  br label %end
end:
  ret void
}
