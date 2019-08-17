; ModuleID = 'cluster_0__XlaCompiledKernel_true__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.29'
source_filename = "cluster_0__XlaCompiledKernel_true__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.29"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@1 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@2 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@3 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@4 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@5 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@6 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@7 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@8 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@9 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@10 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@11 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@12 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@13 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@14 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@15 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@16 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@17 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@18 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@19 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@20 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@21 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"
@22 = private unnamed_addr constant [4 x i8] c"H\A7.>"
@23 = private unnamed_addr constant [4 x i8] c"H\A7\AE\BD"

define void @fusion_2(i8* align 64 dereferenceable(3200) %alloc4, i8* align 16 dereferenceable(3200) %alloc5) {
entry:
  %arg0.1.raw = getelementptr inbounds i8, i8* %alloc5, i64 0
  %arg0.1.typed = bitcast i8* %arg0.1.raw to [5 x [5 x [1 x [32 x float]]]]*
  %fusion.2.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.2.typed = bitcast i8* %fusion.2.raw to [5 x [5 x [1 x [32 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 200
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index_base, 32
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index_base, 32
  %8 = urem i32 %7, 5
  %9 = udiv i32 %linear_index_base, 160
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 32
  %12 = udiv i32 %linear_index1, 32
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 32
  %15 = urem i32 %14, 5
  %16 = udiv i32 %linear_index1, 160
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 32
  %19 = udiv i32 %linear_index2, 32
  %20 = urem i32 %19, 1
  %21 = udiv i32 %linear_index2, 32
  %22 = urem i32 %21, 5
  %23 = udiv i32 %linear_index2, 160
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 32
  %26 = udiv i32 %linear_index3, 32
  %27 = urem i32 %26, 1
  %28 = udiv i32 %linear_index3, 32
  %29 = urem i32 %28, 5
  %30 = udiv i32 %linear_index3, 160
  %31 = icmp ult i32 %linear_index_base, 800
  br i1 %31, label %fusion.2.in_bounds-true, label %fusion.2.in_bounds-after

fusion.2.in_bounds-after:                         ; preds = %fusion.2.in_bounds-true, %entry
  ret void

fusion.2.in_bounds-true:                          ; preds = %entry
  %32 = load float, float* bitcast ([4 x i8]* @0 to float*)
  %33 = bitcast [5 x [5 x [1 x [32 x float]]]]* %arg0.1.typed to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index_base
  %35 = load float, float* %34, !invariant.load !8, !noalias !9
  %36 = load float, float* bitcast ([4 x i8]* @1 to float*)
  %37 = fmul float %35, %36
  %38 = fadd float %32, %37
  %39 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.2.typed to float*
  %40 = getelementptr inbounds float, float* %39, i32 %linear_index_base
  store float %38, float* %40, !alias.scope !9, !noalias !12
  %41 = load float, float* bitcast ([4 x i8]* @2 to float*)
  %42 = bitcast [5 x [5 x [1 x [32 x float]]]]* %arg0.1.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index1
  %44 = load float, float* %43, !invariant.load !8, !noalias !9
  %45 = load float, float* bitcast ([4 x i8]* @3 to float*)
  %46 = fmul float %44, %45
  %47 = fadd float %41, %46
  %48 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.2.typed to float*
  %49 = getelementptr inbounds float, float* %48, i32 %linear_index1
  store float %47, float* %49, !alias.scope !9, !noalias !12
  %50 = load float, float* bitcast ([4 x i8]* @4 to float*)
  %51 = bitcast [5 x [5 x [1 x [32 x float]]]]* %arg0.1.typed to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index2
  %53 = load float, float* %52, !invariant.load !8, !noalias !9
  %54 = load float, float* bitcast ([4 x i8]* @5 to float*)
  %55 = fmul float %53, %54
  %56 = fadd float %50, %55
  %57 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.2.typed to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index2
  store float %56, float* %58, !alias.scope !9, !noalias !12
  %59 = load float, float* bitcast ([4 x i8]* @6 to float*)
  %60 = bitcast [5 x [5 x [1 x [32 x float]]]]* %arg0.1.typed to float*
  %61 = getelementptr inbounds float, float* %60, i32 %linear_index3
  %62 = load float, float* %61, !invariant.load !8, !noalias !9
  %63 = load float, float* bitcast ([4 x i8]* @7 to float*)
  %64 = fmul float %62, %63
  %65 = fadd float %59, %64
  %66 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.2.typed to float*
  %67 = getelementptr inbounds float, float* %66, i32 %linear_index3
  store float %65, float* %67, !alias.scope !9, !noalias !12
  br label %fusion.2.in_bounds-after
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind
declare void @llvm.assume(i1) #1

define void @fusion_1(i8* align 64 dereferenceable(40960) %alloc2, i8* align 16 dereferenceable(40960) %alloc3) {
entry:
  %fusion.1.raw = getelementptr inbounds i8, i8* %alloc2, i64 0
  %fusion.1.typed = bitcast i8* %fusion.1.raw to [1024 x [10 x float]]*
  %arg1.2.raw = getelementptr inbounds i8, i8* %alloc3, i64 0
  %arg1.2.typed = bitcast i8* %arg1.2.raw to [1024 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3072
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 10
  %8 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 10
  %11 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 10
  %14 = udiv i32 %linear_index3, 10
  %15 = icmp ult i32 %linear_index_base, 10240
  br i1 %15, label %fusion.1.in_bounds-true, label %fusion.1.in_bounds-after

fusion.1.in_bounds-after:                         ; preds = %fusion.1.in_bounds-true, %entry
  ret void

fusion.1.in_bounds-true:                          ; preds = %entry
  %16 = bitcast [1024 x [10 x float]]* %arg1.2.typed to float*
  %17 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %18 = load float, float* %17, !invariant.load !8, !noalias !18
  %19 = load float, float* bitcast ([4 x i8]* @8 to float*)
  %20 = fmul float %18, %19
  %21 = load float, float* bitcast ([4 x i8]* @9 to float*)
  %22 = fadd float %20, %21
  %23 = bitcast [1024 x [10 x float]]* %fusion.1.typed to float*
  %24 = getelementptr inbounds float, float* %23, i32 %linear_index_base
  store float %22, float* %24, !alias.scope !18, !noalias !19
  %25 = bitcast [1024 x [10 x float]]* %arg1.2.typed to float*
  %26 = getelementptr inbounds float, float* %25, i32 %linear_index1
  %27 = load float, float* %26, !invariant.load !8, !noalias !18
  %28 = load float, float* bitcast ([4 x i8]* @10 to float*)
  %29 = fmul float %27, %28
  %30 = load float, float* bitcast ([4 x i8]* @11 to float*)
  %31 = fadd float %29, %30
  %32 = bitcast [1024 x [10 x float]]* %fusion.1.typed to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index1
  store float %31, float* %33, !alias.scope !18, !noalias !19
  %34 = bitcast [1024 x [10 x float]]* %arg1.2.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index2
  %36 = load float, float* %35, !invariant.load !8, !noalias !18
  %37 = load float, float* bitcast ([4 x i8]* @12 to float*)
  %38 = fmul float %36, %37
  %39 = load float, float* bitcast ([4 x i8]* @13 to float*)
  %40 = fadd float %38, %39
  %41 = bitcast [1024 x [10 x float]]* %fusion.1.typed to float*
  %42 = getelementptr inbounds float, float* %41, i32 %linear_index2
  store float %40, float* %42, !alias.scope !18, !noalias !19
  %43 = bitcast [1024 x [10 x float]]* %arg1.2.typed to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index3
  %45 = load float, float* %44, !invariant.load !8, !noalias !18
  %46 = load float, float* bitcast ([4 x i8]* @14 to float*)
  %47 = fmul float %45, %46
  %48 = load float, float* bitcast ([4 x i8]* @15 to float*)
  %49 = fadd float %47, %48
  %50 = bitcast [1024 x [10 x float]]* %fusion.1.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index3
  store float %49, float* %51, !alias.scope !18, !noalias !19
  br label %fusion.1.in_bounds-after
}

define void @fusion(i8* align 64 dereferenceable(25690112) %alloc0, i8* align 16 dereferenceable(25690112) %alloc1) {
entry:
  %fusion.raw = getelementptr inbounds i8, i8* %alloc0, i64 0
  %fusion.typed = bitcast i8* %fusion.raw to [6272 x [1024 x float]]*
  %arg2.3.raw = getelementptr inbounds i8, i8* %alloc1, i64 0
  %arg2.3.typed = bitcast i8* %arg2.3.raw to [6272 x [1024 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1605632
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1024
  %5 = udiv i32 %linear_index_base, 1024
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1024
  %8 = udiv i32 %linear_index1, 1024
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1024
  %11 = udiv i32 %linear_index2, 1024
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1024
  %14 = udiv i32 %linear_index3, 1024
  %15 = icmp ult i32 %linear_index_base, 6422528
  br i1 %15, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %16 = bitcast [6272 x [1024 x float]]* %arg2.3.typed to float*
  %17 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %18 = load float, float* %17, !invariant.load !8, !noalias !21
  %19 = load float, float* bitcast ([4 x i8]* @16 to float*)
  %20 = fmul float %18, %19
  %21 = load float, float* bitcast ([4 x i8]* @17 to float*)
  %22 = fadd float %20, %21
  %23 = bitcast [6272 x [1024 x float]]* %fusion.typed to float*
  %24 = getelementptr inbounds float, float* %23, i32 %linear_index_base
  store float %22, float* %24, !alias.scope !21, !noalias !22
  %25 = bitcast [6272 x [1024 x float]]* %arg2.3.typed to float*
  %26 = getelementptr inbounds float, float* %25, i32 %linear_index1
  %27 = load float, float* %26, !invariant.load !8, !noalias !21
  %28 = load float, float* bitcast ([4 x i8]* @18 to float*)
  %29 = fmul float %27, %28
  %30 = load float, float* bitcast ([4 x i8]* @19 to float*)
  %31 = fadd float %29, %30
  %32 = bitcast [6272 x [1024 x float]]* %fusion.typed to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index1
  store float %31, float* %33, !alias.scope !21, !noalias !22
  %34 = bitcast [6272 x [1024 x float]]* %arg2.3.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index2
  %36 = load float, float* %35, !invariant.load !8, !noalias !21
  %37 = load float, float* bitcast ([4 x i8]* @20 to float*)
  %38 = fmul float %36, %37
  %39 = load float, float* bitcast ([4 x i8]* @21 to float*)
  %40 = fadd float %38, %39
  %41 = bitcast [6272 x [1024 x float]]* %fusion.typed to float*
  %42 = getelementptr inbounds float, float* %41, i32 %linear_index2
  store float %40, float* %42, !alias.scope !21, !noalias !22
  %43 = bitcast [6272 x [1024 x float]]* %arg2.3.typed to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index3
  %45 = load float, float* %44, !invariant.load !8, !noalias !21
  %46 = load float, float* bitcast ([4 x i8]* @22 to float*)
  %47 = fmul float %45, %46
  %48 = load float, float* bitcast ([4 x i8]* @23 to float*)
  %49 = fadd float %47, %48
  %50 = bitcast [6272 x [1024 x float]]* %fusion.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index3
  store float %49, float* %51, !alias.scope !21, !noalias !22
  br label %fusion.in_bounds-after
}

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}

!0 = !{void (i8*, i8*)* @fusion_2, !"kernel", i32 1}
!1 = !{void (i8*, i8*)* @fusion_2, !"reqntidx", i32 200}
!2 = !{void (i8*, i8*)* @fusion_1, !"kernel", i32 1}
!3 = !{void (i8*, i8*)* @fusion_1, !"reqntidx", i32 1024}
!4 = !{void (i8*, i8*)* @fusion, !"kernel", i32 1}
!5 = !{void (i8*, i8*)* @fusion, !"reqntidx", i32 1024}
!6 = !{i32 0, i32 1}
!7 = !{i32 0, i32 200}
!8 = !{}
!9 = !{!10}
!10 = !{!"buffer: {index:4, offset:0, size:3200}", !11}
!11 = !{!"XLA global AA domain"}
!12 = !{!13, !14, !15}
!13 = !{!"buffer: {index:0, offset:0, size:25690112}", !11}
!14 = !{!"buffer: {index:2, offset:0, size:40960}", !11}
!15 = !{!"buffer: {index:6, offset:0, size:24}", !11}
!16 = !{i32 0, i32 3}
!17 = !{i32 0, i32 1024}
!18 = !{!14}
!19 = !{!13, !10, !15}
!20 = !{i32 0, i32 1568}
!21 = !{!13}
!22 = !{!14, !10, !15}
