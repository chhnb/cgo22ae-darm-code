target triple = "nvptx64-nvidia-cuda"
define void @test(i1 %left, i32 %n, i32 %m, float %x, float* %out) {
entry:
  br i1 %left, label %L, label %R
L:
  switch i32 %n, label %end [ i32 1, label %LC i32 2, label %LC ]
LC:
  %p = phi i32 [ %n, %L ], [ %n, %L ]
  %a = sitofp i32 %p to float
  %b = fadd float %x, %a
  store float %b, float* %out
  br label %end
R:
  switch i32 %m, label %end [ i32 1, label %RC i32 2, label %RC ]
RC:
  %q = phi i32 [ %m, %R ], [ %m, %R ]
  %c = sitofp i32 %q to float
  %d = fmul float %x, %c
  store float %d, float* %out
  br label %end
end:
  ret void
}
