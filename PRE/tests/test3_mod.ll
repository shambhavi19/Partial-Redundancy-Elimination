; ModuleID = './tests/test3_mod.bc'
source_filename = "./tests/test3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = icmp ne i32 1, 0
  br label %.split

.split:                                           ; preds = %0
  br i1 %1, label %2, label %4

2:                                                ; preds = %.split
  %3 = add nsw i32 3, 2
  br label %.split1

.split1:                                          ; preds = %2
  br label %.split1.split

.split1.split:                                    ; preds = %.split1
  br label %5

4:                                                ; preds = %.split
  br label %.split4

.split4:                                          ; preds = %4
  br label %5

5:                                                ; preds = %.split4, %.split1.split
  %.0 = phi i32 [ 3, %.split1.split ], [ 1, %.split4 ]
  br label %.split3

.split3:                                          ; preds = %5
  %6 = add nsw i32 %.0, 2
  br label %.split2

.split2:                                          ; preds = %.split3
  ret i32 %6
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
