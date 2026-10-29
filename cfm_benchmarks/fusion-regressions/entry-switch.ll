target triple = "nvptx64-nvidia-cuda"
define void @test(i8 %tag, i32 %a, i32 %b, i32* %out) {
entry:
  switch i8 %tag, label %done [i8 0, label %c0 i8 45, label %c45 i8 90, label %c90 i8 135, label %c135]
c0:
  %v0 = add i32 %a, %b
  store i32 %v0, i32* %out
  br label %done
c45:
  %v1 = sub i32 %a, %b
  store i32 %v1, i32* %out
  br label %done
c90:
  %v2 = mul i32 %a, %b
  store i32 %v2, i32* %out
  br label %done
c135:
  %v3 = xor i32 %a, %b
  store i32 %v3, i32* %out
  br label %done
done:
  ret void
}
