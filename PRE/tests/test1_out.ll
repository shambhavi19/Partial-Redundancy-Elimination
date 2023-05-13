; ModuleID = './tests/test1_out.bc'
source_filename = "./tests/test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func(i32 %0, i32 %1) #0 {
  %3 = icmp slt i32 %0, %1
  br label %.split

.split:                                           ; preds = %2
  br i1 %3, label %4, label %7

4:                                                ; preds = %.split
  %5 = add nsw i32 %0, %1
  br label %.split2

.split2:                                          ; preds = %4
  %6 = add nsw i32 undef, %1
  br label %.split1

.split1:                                          ; preds = %.split2
  br label %.split1.split

.split1.split:                                    ; preds = %.split1
  br label %9

7:                                                ; preds = %.split
  %8 = sub nsw i32 %0, %1
  br label %.split3

.split3:                                          ; preds = %7
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  br label %9

9:                                                ; preds = %.split3.split, %.split1.split
  %10 = add nsw i32 undef, %1
  br label %.split4

.split4:                                          ; preds = %9
  ret i32 undef
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
