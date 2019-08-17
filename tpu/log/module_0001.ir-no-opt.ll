; ModuleID = 'cluster_1__XlaCompiledKernel_true__XlaNumConstantArgs_5__XlaNumResourceArgs_0_.76'
source_filename = "cluster_1__XlaCompiledKernel_true__XlaNumConstantArgs_5__XlaNumResourceArgs_0_.76"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_24 = constant [4 x i8] c"\00\00\80\FF", align 64
@buffer_for_constant_30 = constant [4 x i8] zeroinitializer, align 64
@0 = private unnamed_addr constant [4 x i8] c"\00\00\80;"
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80;"
@2 = private unnamed_addr constant [4 x i8] c"\00\00\80;"
@3 = private unnamed_addr constant [4 x i8] c"\00\00\80;"
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@5 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [4 x i8] zeroinitializer
@9 = private unnamed_addr constant [4 x i8] zeroinitializer

define void @fusion_6(i8* align 64 dereferenceable(4000) %alloc4, i8* align 16 dereferenceable(40) %alloc7, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc7, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to [1 x [10 x float]]*
  %fusion.6.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.6.typed = bitcast i8* %fusion.6.raw to [100 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %2 = mul nuw nsw i32 %0, 250
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 250
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
  %15 = icmp ult i32 %linear_index_base, 1000
  br i1 %15, label %fusion.6.in_bounds-true, label %fusion.6.in_bounds-after

fusion.6.in_bounds-after:                         ; preds = %fusion.6.in_bounds-true, %entry
  ret void

fusion.6.in_bounds-true:                          ; preds = %entry
  %16 = urem i32 %linear_index_base, 10
  %17 = mul nuw nsw i32 %4, 1
  %18 = add nuw nsw i32 0, %17
  %19 = udiv i32 %18, 10
  %20 = bitcast [1 x [10 x float]]* %arg5.6.typed to float*
  %21 = getelementptr inbounds float, float* %20, i32 %16
  %22 = load float, float* %21, !invariant.load !20, !noalias !21
  %23 = bitcast [100 x [10 x float]]* %fusion.6.typed to float*
  %24 = getelementptr inbounds float, float* %23, i32 %linear_index_base
  store float %22, float* %24, !alias.scope !21, !noalias !24
  %25 = urem i32 %linear_index1, 10
  %26 = mul nuw nsw i32 %7, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 10
  %29 = bitcast [1 x [10 x float]]* %arg5.6.typed to float*
  %30 = getelementptr inbounds float, float* %29, i32 %25
  %31 = load float, float* %30, !invariant.load !20, !noalias !21
  %32 = bitcast [100 x [10 x float]]* %fusion.6.typed to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index1
  store float %31, float* %33, !alias.scope !21, !noalias !24
  %34 = urem i32 %linear_index2, 10
  %35 = mul nuw nsw i32 %10, 1
  %36 = add nuw nsw i32 0, %35
  %37 = udiv i32 %36, 10
  %38 = bitcast [1 x [10 x float]]* %arg5.6.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %34
  %40 = load float, float* %39, !invariant.load !20, !noalias !21
  %41 = bitcast [100 x [10 x float]]* %fusion.6.typed to float*
  %42 = getelementptr inbounds float, float* %41, i32 %linear_index2
  store float %40, float* %42, !alias.scope !21, !noalias !24
  %43 = urem i32 %linear_index3, 10
  %44 = mul nuw nsw i32 %13, 1
  %45 = add nuw nsw i32 0, %44
  %46 = udiv i32 %45, 10
  %47 = bitcast [1 x [10 x float]]* %arg5.6.typed to float*
  %48 = getelementptr inbounds float, float* %47, i32 %43
  %49 = load float, float* %48, !invariant.load !20, !noalias !21
  %50 = bitcast [100 x [10 x float]]* %fusion.6.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index3
  store float %49, float* %51, !alias.scope !21, !noalias !24
  br label %fusion.6.in_bounds-after
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind
declare void @llvm.assume(i1) #1

define void @fusion_5(i8* align 16 dereferenceable(313600) %alloc1, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %fusion.5.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %fusion.5.typed = bitcast i8* %fusion.5.raw to [100 x [1 x [28 x [28 x float]]]]*
  %arg6.7.raw = getelementptr inbounds i8, i8* %alloc1, i64 0
  %arg6.7.typed = bitcast i8* %arg6.7.raw to [100 x [28 x [28 x [1 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20480
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 28
  %5 = udiv i32 %linear_index_base, 28
  %6 = urem i32 %5, 28
  %7 = udiv i32 %linear_index_base, 784
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index_base, 784
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 28
  %12 = udiv i32 %linear_index1, 28
  %13 = urem i32 %12, 28
  %14 = udiv i32 %linear_index1, 784
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index1, 784
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 28
  %19 = udiv i32 %linear_index2, 28
  %20 = urem i32 %19, 28
  %21 = udiv i32 %linear_index2, 784
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 784
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 28
  %26 = udiv i32 %linear_index3, 28
  %27 = urem i32 %26, 28
  %28 = udiv i32 %linear_index3, 784
  %29 = urem i32 %28, 1
  %30 = udiv i32 %linear_index3, 784
  %31 = icmp ult i32 %linear_index_base, 78400
  br i1 %31, label %fusion.5.in_bounds-true, label %fusion.5.in_bounds-after

fusion.5.in_bounds-after:                         ; preds = %fusion.5.in_bounds-true, %entry
  ret void

fusion.5.in_bounds-true:                          ; preds = %entry
  %32 = mul nuw nsw i32 %4, 1
  %33 = add nuw nsw i32 0, %32
  %34 = udiv i32 %33, 28
  %35 = mul nuw nsw i32 %6, 1
  %36 = add nuw nsw i32 0, %35
  %37 = udiv i32 %36, 28
  %38 = mul nuw nsw i32 %8, 1
  %39 = add nuw nsw i32 0, %38
  %40 = mul nuw nsw i32 %9, 1
  %41 = add nuw nsw i32 0, %40
  %42 = udiv i32 %41, 100
  %43 = load float, float* bitcast ([4 x i8]* @0 to float*)
  %44 = mul nuw nsw i32 %33, 1
  %45 = add nuw nsw i32 0, %44
  %46 = udiv i32 %45, 28
  %47 = mul nuw nsw i32 %36, 1
  %48 = add nuw nsw i32 0, %47
  %49 = udiv i32 %48, 28
  %50 = mul nuw nsw i32 %41, 1
  %51 = add nuw nsw i32 0, %50
  %52 = udiv i32 %51, 100
  %53 = bitcast [100 x [28 x [28 x [1 x float]]]]* %arg6.7.typed to float*
  %54 = getelementptr inbounds float, float* %53, i32 %linear_index_base
  %55 = load float, float* %54, !invariant.load !20, !noalias !28
  %56 = fmul float %43, %55
  %57 = bitcast [100 x [1 x [28 x [28 x float]]]]* %fusion.5.typed to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index_base
  store float %56, float* %58, !alias.scope !28, !noalias !30
  %59 = mul nuw nsw i32 %11, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 28
  %62 = mul nuw nsw i32 %13, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 28
  %65 = mul nuw nsw i32 %15, 1
  %66 = add nuw nsw i32 0, %65
  %67 = mul nuw nsw i32 %16, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 100
  %70 = load float, float* bitcast ([4 x i8]* @1 to float*)
  %71 = mul nuw nsw i32 %60, 1
  %72 = add nuw nsw i32 0, %71
  %73 = udiv i32 %72, 28
  %74 = mul nuw nsw i32 %63, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 28
  %77 = mul nuw nsw i32 %68, 1
  %78 = add nuw nsw i32 0, %77
  %79 = udiv i32 %78, 100
  %80 = bitcast [100 x [28 x [28 x [1 x float]]]]* %arg6.7.typed to float*
  %81 = getelementptr inbounds float, float* %80, i32 %linear_index1
  %82 = load float, float* %81, !invariant.load !20, !noalias !28
  %83 = fmul float %70, %82
  %84 = bitcast [100 x [1 x [28 x [28 x float]]]]* %fusion.5.typed to float*
  %85 = getelementptr inbounds float, float* %84, i32 %linear_index1
  store float %83, float* %85, !alias.scope !28, !noalias !30
  %86 = mul nuw nsw i32 %18, 1
  %87 = add nuw nsw i32 0, %86
  %88 = udiv i32 %87, 28
  %89 = mul nuw nsw i32 %20, 1
  %90 = add nuw nsw i32 0, %89
  %91 = udiv i32 %90, 28
  %92 = mul nuw nsw i32 %22, 1
  %93 = add nuw nsw i32 0, %92
  %94 = mul nuw nsw i32 %23, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 100
  %97 = load float, float* bitcast ([4 x i8]* @2 to float*)
  %98 = mul nuw nsw i32 %87, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 28
  %101 = mul nuw nsw i32 %90, 1
  %102 = add nuw nsw i32 0, %101
  %103 = udiv i32 %102, 28
  %104 = mul nuw nsw i32 %95, 1
  %105 = add nuw nsw i32 0, %104
  %106 = udiv i32 %105, 100
  %107 = bitcast [100 x [28 x [28 x [1 x float]]]]* %arg6.7.typed to float*
  %108 = getelementptr inbounds float, float* %107, i32 %linear_index2
  %109 = load float, float* %108, !invariant.load !20, !noalias !28
  %110 = fmul float %97, %109
  %111 = bitcast [100 x [1 x [28 x [28 x float]]]]* %fusion.5.typed to float*
  %112 = getelementptr inbounds float, float* %111, i32 %linear_index2
  store float %110, float* %112, !alias.scope !28, !noalias !30
  %113 = mul nuw nsw i32 %25, 1
  %114 = add nuw nsw i32 0, %113
  %115 = udiv i32 %114, 28
  %116 = mul nuw nsw i32 %27, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 28
  %119 = mul nuw nsw i32 %29, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %30, 1
  %122 = add nuw nsw i32 0, %121
  %123 = udiv i32 %122, 100
  %124 = load float, float* bitcast ([4 x i8]* @3 to float*)
  %125 = mul nuw nsw i32 %114, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 28
  %128 = mul nuw nsw i32 %117, 1
  %129 = add nuw nsw i32 0, %128
  %130 = udiv i32 %129, 28
  %131 = mul nuw nsw i32 %122, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 100
  %134 = bitcast [100 x [28 x [28 x [1 x float]]]]* %arg6.7.typed to float*
  %135 = getelementptr inbounds float, float* %134, i32 %linear_index3
  %136 = load float, float* %135, !invariant.load !20, !noalias !28
  %137 = fmul float %124, %136
  %138 = bitcast [100 x [1 x [28 x [28 x float]]]]* %fusion.5.typed to float*
  %139 = getelementptr inbounds float, float* %138, i32 %linear_index3
  store float %137, float* %139, !alias.scope !28, !noalias !30
  br label %fusion.5.in_bounds-after
}

define void @copy_4(i8* align 64 dereferenceable(4000) %alloc4, i8* align 16 dereferenceable(3200) %alloc5, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %arg1.2.raw = getelementptr inbounds i8, i8* %alloc5, i64 0
  %arg1.2.typed = bitcast i8* %arg1.2.raw to [5 x [5 x [1 x [32 x float]]]]*
  %copy.4.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %copy.4.typed = bitcast i8* %copy.4.raw to [32 x [1 x [5 x [5 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %2 = mul nuw nsw i32 %0, 200
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 5
  %5 = udiv i32 %linear_index_base, 5
  %6 = urem i32 %5, 5
  %7 = udiv i32 %linear_index_base, 25
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index_base, 25
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 5
  %12 = udiv i32 %linear_index1, 5
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index1, 25
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index1, 25
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 5
  %19 = udiv i32 %linear_index2, 5
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index2, 25
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 25
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 5
  %26 = udiv i32 %linear_index3, 5
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index3, 25
  %29 = urem i32 %28, 1
  %30 = udiv i32 %linear_index3, 25
  %31 = icmp ult i32 %linear_index_base, 800
  br i1 %31, label %copy.4.in_bounds-true, label %copy.4.in_bounds-after

copy.4.in_bounds-after:                           ; preds = %copy.4.in_bounds-true, %entry
  ret void

copy.4.in_bounds-true:                            ; preds = %entry
  %32 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg1.2.typed, i32 0, i32 %6, i32 %4, i32 0, i32 %9
  %33 = load float, float* %32, !invariant.load !20, !noalias !36
  %34 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.4.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  store float %33, float* %35, !alias.scope !36, !noalias !37
  %36 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg1.2.typed, i32 0, i32 %13, i32 %11, i32 0, i32 %16
  %37 = load float, float* %36, !invariant.load !20, !noalias !36
  %38 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.4.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %37, float* %39, !alias.scope !36, !noalias !37
  %40 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg1.2.typed, i32 0, i32 %20, i32 %18, i32 0, i32 %23
  %41 = load float, float* %40, !invariant.load !20, !noalias !36
  %42 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.4.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index2
  store float %41, float* %43, !alias.scope !36, !noalias !37
  %44 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg1.2.typed, i32 0, i32 %27, i32 %25, i32 0, i32 %30
  %45 = load float, float* %44, !invariant.load !20, !noalias !36
  %46 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.4.typed to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  store float %45, float* %47, !alias.scope !36, !noalias !37
  br label %copy.4.in_bounds-after
}

define void @fusion_4(i8* align 16 dereferenceable(128) %alloc6, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %parameter_buffer4 = alloca float
  %parameter_buffer = alloca float
  %return_buffer = alloca float
  %reduce-window.0.invar_address.window.3 = alloca i32
  %reduce-window.0.invar_address.window.2 = alloca i32
  %reduce-window.0.invar_address.window.1 = alloca i32
  %reduce-window.0.invar_address.window.0 = alloca i32
  %reduce_window_accum_ptr = alloca float
  %get-tuple-element.1.raw = getelementptr inbounds i8, i8* %temp_buf, i64 2508800
  %get-tuple-element.1.typed = bitcast i8* %get-tuple-element.1.raw to [100 x [32 x [28 x [28 x float]]]]*
  %arg0.1.raw = getelementptr inbounds i8, i8* %alloc6, i64 0
  %arg0.1.typed = bitcast i8* %arg0.1.raw to [32 x float]*
  %fusion.4.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %fusion.4.typed = bitcast i8* %fusion.4.raw to [100 x [6272 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 627712
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 6272
  %5 = udiv i32 %linear_index, 6272
  %6 = icmp ult i32 %linear_index, 627200
  br i1 %6, label %fusion.4.in_bounds-true, label %fusion.4.in_bounds-after

fusion.4.in_bounds-after:                         ; preds = %reduce-window.0.loop_exit.window.0, %entry
  ret void

fusion.4.in_bounds-true:                          ; preds = %entry
  %7 = mul nuw nsw i32 %4, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 32
  %10 = udiv i32 %8, 32
  %11 = urem i32 %10, 14
  %12 = udiv i32 %10, 14
  %13 = udiv i32 %12, 14
  %14 = mul nuw nsw i32 %5, 1
  %15 = add nuw nsw i32 0, %14
  %16 = udiv i32 %15, 100
  %17 = mul nuw nsw i32 %11, 1
  %18 = add nuw nsw i32 0, %17
  %19 = mul nuw nsw i32 %12, 14
  %20 = add nuw nsw i32 %18, %19
  %21 = mul nuw nsw i32 %9, 196
  %22 = add nuw nsw i32 %20, %21
  %23 = mul nuw nsw i32 %15, 6272
  %24 = add nuw nsw i32 %22, %23
  %25 = udiv i32 %24, 1
  %26 = urem i32 %25, 14
  %27 = udiv i32 %24, 14
  %28 = urem i32 %27, 14
  %29 = udiv i32 %24, 196
  %30 = urem i32 %29, 32
  %31 = udiv i32 %24, 6272
  %32 = load float, float* bitcast ([4 x i8]* @4 to float*)
  %33 = load float, float* bitcast ([4 x i8]* @5 to float*)
  store float %33, float* %reduce_window_accum_ptr
  store i32 0, i32* %reduce-window.0.invar_address.window.0
  br label %reduce-window.0.loop_header.window.0

reduce-window.0.loop_header.window.0:             ; preds = %reduce-window.0.loop_exit.window.1, %fusion.4.in_bounds-true
  %reduce-window.0.indvar.window.0 = load i32, i32* %reduce-window.0.invar_address.window.0
  %34 = icmp uge i32 %reduce-window.0.indvar.window.0, 1
  br i1 %34, label %reduce-window.0.loop_exit.window.0, label %reduce-window.0.loop_body.window.0

reduce-window.0.loop_body.window.0:               ; preds = %reduce-window.0.loop_header.window.0
  store i32 0, i32* %reduce-window.0.invar_address.window.1
  br label %reduce-window.0.loop_header.window.1

reduce-window.0.loop_header.window.1:             ; preds = %reduce-window.0.loop_exit.window.2, %reduce-window.0.loop_body.window.0
  %reduce-window.0.indvar.window.1 = load i32, i32* %reduce-window.0.invar_address.window.1
  %35 = icmp uge i32 %reduce-window.0.indvar.window.1, 1
  br i1 %35, label %reduce-window.0.loop_exit.window.1, label %reduce-window.0.loop_body.window.1

reduce-window.0.loop_body.window.1:               ; preds = %reduce-window.0.loop_header.window.1
  store i32 0, i32* %reduce-window.0.invar_address.window.2
  br label %reduce-window.0.loop_header.window.2

reduce-window.0.loop_header.window.2:             ; preds = %reduce-window.0.loop_exit.window.3, %reduce-window.0.loop_body.window.1
  %reduce-window.0.indvar.window.2 = load i32, i32* %reduce-window.0.invar_address.window.2
  %36 = icmp uge i32 %reduce-window.0.indvar.window.2, 2
  br i1 %36, label %reduce-window.0.loop_exit.window.2, label %reduce-window.0.loop_body.window.2

reduce-window.0.loop_body.window.2:               ; preds = %reduce-window.0.loop_header.window.2
  store i32 0, i32* %reduce-window.0.invar_address.window.3
  br label %reduce-window.0.loop_header.window.3

reduce-window.0.loop_header.window.3:             ; preds = %in_bounds-after, %reduce-window.0.loop_body.window.2
  %reduce-window.0.indvar.window.3 = load i32, i32* %reduce-window.0.invar_address.window.3
  %37 = icmp uge i32 %reduce-window.0.indvar.window.3, 2
  br i1 %37, label %reduce-window.0.loop_exit.window.3, label %reduce-window.0.loop_body.window.3

reduce-window.0.loop_body.window.3:               ; preds = %reduce-window.0.loop_header.window.3
  %38 = mul nsw i32 %31, 1
  %39 = mul nsw i32 %reduce-window.0.indvar.window.0, 1
  %40 = add nsw i32 %38, %39
  %41 = sub nsw i32 %40, 0
  %42 = srem i32 %41, 1
  %43 = icmp eq i32 %42, 0
  %44 = and i1 true, %43
  %45 = sdiv i32 %41, 1
  %46 = icmp ult i32 %45, 100
  %47 = and i1 %44, %46
  %48 = mul nsw i32 %30, 1
  %49 = mul nsw i32 %reduce-window.0.indvar.window.1, 1
  %50 = add nsw i32 %48, %49
  %51 = sub nsw i32 %50, 0
  %52 = srem i32 %51, 1
  %53 = icmp eq i32 %52, 0
  %54 = and i1 %47, %53
  %55 = sdiv i32 %51, 1
  %56 = icmp ult i32 %55, 32
  %57 = and i1 %54, %56
  %58 = mul nsw i32 %28, 2
  %59 = mul nsw i32 %reduce-window.0.indvar.window.2, 1
  %60 = add nsw i32 %58, %59
  %61 = sub nsw i32 %60, 0
  %62 = srem i32 %61, 1
  %63 = icmp eq i32 %62, 0
  %64 = and i1 %57, %63
  %65 = sdiv i32 %61, 1
  %66 = icmp ult i32 %65, 28
  %67 = and i1 %64, %66
  %68 = mul nsw i32 %26, 2
  %69 = mul nsw i32 %reduce-window.0.indvar.window.3, 1
  %70 = add nsw i32 %68, %69
  %71 = sub nsw i32 %70, 0
  %72 = srem i32 %71, 1
  %73 = icmp eq i32 %72, 0
  %74 = and i1 %67, %73
  %75 = sdiv i32 %71, 1
  %76 = icmp ult i32 %75, 28
  %77 = and i1 %74, %76
  br i1 %77, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %invar.inc3 = add nuw nsw i32 %reduce-window.0.indvar.window.3, 1
  store i32 %invar.inc3, i32* %reduce-window.0.invar_address.window.3
  br label %reduce-window.0.loop_header.window.3

reduce-window.0.loop_exit.window.3:               ; preds = %reduce-window.0.loop_header.window.3
  %invar.inc2 = add nuw nsw i32 %reduce-window.0.indvar.window.2, 1
  store i32 %invar.inc2, i32* %reduce-window.0.invar_address.window.2
  br label %reduce-window.0.loop_header.window.2

reduce-window.0.loop_exit.window.2:               ; preds = %reduce-window.0.loop_header.window.2
  %invar.inc1 = add nuw nsw i32 %reduce-window.0.indvar.window.1, 1
  store i32 %invar.inc1, i32* %reduce-window.0.invar_address.window.1
  br label %reduce-window.0.loop_header.window.1

reduce-window.0.loop_exit.window.1:               ; preds = %reduce-window.0.loop_header.window.1
  %invar.inc = add nuw nsw i32 %reduce-window.0.indvar.window.0, 1
  store i32 %invar.inc, i32* %reduce-window.0.invar_address.window.0
  br label %reduce-window.0.loop_header.window.0

reduce-window.0.loop_exit.window.0:               ; preds = %reduce-window.0.loop_header.window.0
  %78 = load float, float* %reduce_window_accum_ptr
  %79 = call float @llvm.maxnum.f32(float %32, float %78)
  %80 = bitcast [100 x [6272 x float]]* %fusion.4.typed to float*
  %81 = getelementptr inbounds float, float* %80, i32 %linear_index
  store float %79, float* %81, !alias.scope !39, !noalias !41
  br label %fusion.4.in_bounds-after

in_bounds-true:                                   ; preds = %reduce-window.0.loop_body.window.3
  %82 = getelementptr inbounds [100 x [32 x [28 x [28 x float]]]], [100 x [32 x [28 x [28 x float]]]]* %get-tuple-element.1.typed, i32 0, i32 %45, i32 %55, i32 %65, i32 %75
  %83 = load float, float* %82, !invariant.load !20, !alias.scope !42, !noalias !43
  %84 = getelementptr inbounds [32 x float], [32 x float]* %arg0.1.typed, i32 0, i32 %55
  %85 = load float, float* %84, !invariant.load !20, !noalias !44
  %86 = fadd float %83, %85
  %87 = load float, float* %reduce_window_accum_ptr
  store float %87, float* %parameter_buffer
  store float %86, float* %parameter_buffer4
  call void @max_F32_25(float* %parameter_buffer, float* %parameter_buffer4, float* %return_buffer, i8* %temp_buf)
  %88 = load float, float* %return_buffer
  store float %88, float* %reduce_window_accum_ptr
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce-window.0.loop_body.window.3
  br label %in_bounds-after
}

define internal void @max_F32_25(float* dereferenceable(4) %lhs.26.typed, float* dereferenceable(4) %rhs.27.typed, float* dereferenceable(4) %output_arg, i8* %temp_buffer) {
entry:
  %maximum.28.typed = alloca float
  %0 = load float, float* %lhs.26.typed, !alias.scope !45, !noalias !47
  %1 = load float, float* %rhs.27.typed, !alias.scope !49, !noalias !47
  %2 = call float @llvm.maxnum.f32(float %0, float %1)
  store float %2, float* %maximum.28.typed, !alias.scope !47
  %load_ret_value = load float, float* %maximum.28.typed
  store float %load_ret_value, float* %output_arg
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.maxnum.f32(float, float) #2

define void @fusion_3(i8* align 16 dereferenceable(4096) %alloc3, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %arg3.4.raw = getelementptr inbounds i8, i8* %alloc3, i64 0
  %arg3.4.typed = bitcast i8* %arg3.4.raw to [1 x [1024 x float]]*
  %dot.35.raw = getelementptr inbounds i8, i8* %temp_buf, i64 2508800
  %dot.35.typed = bitcast i8* %dot.35.raw to [100 x [1024 x float]]*
  %fusion.3.raw = getelementptr inbounds i8, i8* %temp_buf, i64 2508800
  %fusion.3.typed = bitcast i8* %fusion.3.raw to [100 x [1024 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 25600
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
  %15 = icmp ult i32 %linear_index_base, 102400
  br i1 %15, label %fusion.3.in_bounds-true, label %fusion.3.in_bounds-after

fusion.3.in_bounds-after:                         ; preds = %fusion.3.in_bounds-true, %entry
  ret void

fusion.3.in_bounds-true:                          ; preds = %entry
  %16 = load float, float* bitcast ([4 x i8]* @6 to float*)
  %17 = urem i32 %linear_index_base, 1024
  %18 = mul nuw nsw i32 %4, 1
  %19 = add nuw nsw i32 0, %18
  %20 = udiv i32 %19, 1024
  %21 = bitcast [1 x [1024 x float]]* %arg3.4.typed to float*
  %22 = getelementptr inbounds float, float* %21, i32 %17
  %23 = load float, float* %22, !invariant.load !20, !noalias !24
  %24 = bitcast [100 x [1024 x float]]* %dot.35.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index_base
  %26 = load float, float* %25, !alias.scope !24, !noalias !39
  %27 = fadd float %23, %26
  %28 = call float @llvm.maxnum.f32(float %16, float %27)
  %29 = bitcast [100 x [1024 x float]]* %fusion.3.typed to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index_base
  store float %28, float* %30, !alias.scope !24, !noalias !21
  %31 = load float, float* bitcast ([4 x i8]* @7 to float*)
  %32 = urem i32 %linear_index1, 1024
  %33 = mul nuw nsw i32 %7, 1
  %34 = add nuw nsw i32 0, %33
  %35 = udiv i32 %34, 1024
  %36 = bitcast [1 x [1024 x float]]* %arg3.4.typed to float*
  %37 = getelementptr inbounds float, float* %36, i32 %32
  %38 = load float, float* %37, !invariant.load !20, !noalias !24
  %39 = bitcast [100 x [1024 x float]]* %dot.35.typed to float*
  %40 = getelementptr inbounds float, float* %39, i32 %linear_index1
  %41 = load float, float* %40, !alias.scope !24, !noalias !39
  %42 = fadd float %38, %41
  %43 = call float @llvm.maxnum.f32(float %31, float %42)
  %44 = bitcast [100 x [1024 x float]]* %fusion.3.typed to float*
  %45 = getelementptr inbounds float, float* %44, i32 %linear_index1
  store float %43, float* %45, !alias.scope !24, !noalias !21
  %46 = load float, float* bitcast ([4 x i8]* @8 to float*)
  %47 = urem i32 %linear_index2, 1024
  %48 = mul nuw nsw i32 %10, 1
  %49 = add nuw nsw i32 0, %48
  %50 = udiv i32 %49, 1024
  %51 = bitcast [1 x [1024 x float]]* %arg3.4.typed to float*
  %52 = getelementptr inbounds float, float* %51, i32 %47
  %53 = load float, float* %52, !invariant.load !20, !noalias !24
  %54 = bitcast [100 x [1024 x float]]* %dot.35.typed to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index2
  %56 = load float, float* %55, !alias.scope !24, !noalias !39
  %57 = fadd float %53, %56
  %58 = call float @llvm.maxnum.f32(float %46, float %57)
  %59 = bitcast [100 x [1024 x float]]* %fusion.3.typed to float*
  %60 = getelementptr inbounds float, float* %59, i32 %linear_index2
  store float %58, float* %60, !alias.scope !24, !noalias !21
  %61 = load float, float* bitcast ([4 x i8]* @9 to float*)
  %62 = urem i32 %linear_index3, 1024
  %63 = mul nuw nsw i32 %13, 1
  %64 = add nuw nsw i32 0, %63
  %65 = udiv i32 %64, 1024
  %66 = bitcast [1 x [1024 x float]]* %arg3.4.typed to float*
  %67 = getelementptr inbounds float, float* %66, i32 %62
  %68 = load float, float* %67, !invariant.load !20, !noalias !24
  %69 = bitcast [100 x [1024 x float]]* %dot.35.typed to float*
  %70 = getelementptr inbounds float, float* %69, i32 %linear_index3
  %71 = load float, float* %70, !alias.scope !24, !noalias !39
  %72 = fadd float %68, %71
  %73 = call float @llvm.maxnum.f32(float %61, float %72)
  %74 = bitcast [100 x [1024 x float]]* %fusion.3.typed to float*
  %75 = getelementptr inbounds float, float* %74, i32 %linear_index3
  store float %73, float* %75, !alias.scope !24, !noalias !21
  br label %fusion.3.in_bounds-after
}

define void @reduce_53(i8* align 64 dereferenceable(4000) %alloc4, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %reduce.53.inner.invar_address.reduction_dim.1 = alloca i64
  %reduce.53.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %reduce.53.typed = bitcast i8* %reduce.53.raw to [100 x float]*
  %fusion.2.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.2.typed = bitcast i8* %fusion.2.raw to [100 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %2 = mul nuw nsw i32 %0, 100
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 100
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 100
  br i1 %4, label %reduce.53.in_bounds-true, label %reduce.53.in_bounds-after

reduce.53.in_bounds-after:                        ; preds = %reduce.53.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce.53.in_bounds-true:                         ; preds = %entry
  %5 = alloca float
  %6 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_24 to float*)
  store float %6, float* %5
  store i64 0, i64* %reduce.53.inner.invar_address.reduction_dim.1
  br label %reduce.53.inner.loop_header.reduction_dim.1

reduce.53.inner.loop_header.reduction_dim.1:      ; preds = %reduce.53.inner.loop_body.reduction_dim.1, %reduce.53.in_bounds-true
  %reduce.53.inner.indvar.reduction_dim.1 = load i64, i64* %reduce.53.inner.invar_address.reduction_dim.1
  %7 = icmp uge i64 %reduce.53.inner.indvar.reduction_dim.1, 10
  br i1 %7, label %reduce.53.inner.loop_exit.reduction_dim.1, label %reduce.53.inner.loop_body.reduction_dim.1

reduce.53.inner.loop_body.reduction_dim.1:        ; preds = %reduce.53.inner.loop_header.reduction_dim.1
  %8 = getelementptr inbounds [100 x [10 x float]], [100 x [10 x float]]* %fusion.2.typed, i32 0, i32 %3, i64 %reduce.53.inner.indvar.reduction_dim.1
  call void @owlnode52_reduction_49(float* %5, float* %8, float* %5, i8* %temp_buf)
  %invar.inc = add nuw nsw i64 %reduce.53.inner.indvar.reduction_dim.1, 1
  store i64 %invar.inc, i64* %reduce.53.inner.invar_address.reduction_dim.1
  br label %reduce.53.inner.loop_header.reduction_dim.1

reduce.53.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.53.inner.loop_header.reduction_dim.1
  %9 = load float, float* %5
  %10 = bitcast [100 x float]* %reduce.53.typed to float*
  %11 = getelementptr inbounds float, float* %10, i32 %linear_index
  store float %9, float* %11, !alias.scope !53, !noalias !55
  br label %reduce.53.in_bounds-after
}

define internal void @owlnode52_reduction_49(float* dereferenceable(4) %x.50.typed, float* dereferenceable(4) %y.51.typed, float* dereferenceable(4) %output_arg, i8* %temp_buffer) {
entry:
  %maximum.52.typed = alloca float
  %0 = load float, float* %x.50.typed, !alias.scope !57, !noalias !59
  %1 = load float, float* %y.51.typed, !alias.scope !61, !noalias !59
  %2 = call float @llvm.maxnum.f32(float %0, float %1)
  store float %2, float* %maximum.52.typed, !alias.scope !59
  %load_ret_value = load float, float* %maximum.52.typed
  store float %load_ret_value, float* %output_arg
  ret void
}

define void @fusion_1(i8* align 64 dereferenceable(4000) %alloc4, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %reduce.53.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %reduce.53.typed = bitcast i8* %reduce.53.raw to [100 x float]*
  %fusion.2.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.2.typed = bitcast i8* %fusion.2.raw to [100 x [10 x float]]*
  %fusion.1.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.1.typed = bitcast i8* %fusion.1.raw to [100 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %2 = mul nuw nsw i32 %0, 250
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 250
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
  %15 = icmp ult i32 %linear_index_base, 1000
  br i1 %15, label %fusion.1.in_bounds-true, label %fusion.1.in_bounds-after

fusion.1.in_bounds-after:                         ; preds = %fusion.1.in_bounds-true, %entry
  ret void

fusion.1.in_bounds-true:                          ; preds = %entry
  %16 = bitcast [100 x [10 x float]]* %fusion.2.typed to float*
  %17 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %18 = load float, float* %17, !alias.scope !21, !noalias !63
  %19 = udiv i32 %linear_index_base, 10
  %20 = bitcast [100 x float]* %reduce.53.typed to float*
  %21 = getelementptr inbounds float, float* %20, i32 %19
  %22 = load float, float* %21, !invariant.load !20, !alias.scope !53, !noalias !55
  %23 = fsub float %18, %22
  %24 = call float @__nv_expf(float %23)
  %25 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %26 = getelementptr inbounds float, float* %25, i32 %linear_index_base
  store float %24, float* %26, !alias.scope !21, !noalias !64
  %27 = bitcast [100 x [10 x float]]* %fusion.2.typed to float*
  %28 = getelementptr inbounds float, float* %27, i32 %linear_index1
  %29 = load float, float* %28, !alias.scope !21, !noalias !63
  %30 = udiv i32 %linear_index1, 10
  %31 = bitcast [100 x float]* %reduce.53.typed to float*
  %32 = getelementptr inbounds float, float* %31, i32 %30
  %33 = load float, float* %32, !invariant.load !20, !alias.scope !53, !noalias !55
  %34 = fsub float %29, %33
  %35 = call float @__nv_expf(float %34)
  %36 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index1
  store float %35, float* %37, !alias.scope !21, !noalias !64
  %38 = bitcast [100 x [10 x float]]* %fusion.2.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index2
  %40 = load float, float* %39, !alias.scope !21, !noalias !63
  %41 = udiv i32 %linear_index2, 10
  %42 = bitcast [100 x float]* %reduce.53.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %41
  %44 = load float, float* %43, !invariant.load !20, !alias.scope !53, !noalias !55
  %45 = fsub float %40, %44
  %46 = call float @__nv_expf(float %45)
  %47 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %48 = getelementptr inbounds float, float* %47, i32 %linear_index2
  store float %46, float* %48, !alias.scope !21, !noalias !64
  %49 = bitcast [100 x [10 x float]]* %fusion.2.typed to float*
  %50 = getelementptr inbounds float, float* %49, i32 %linear_index3
  %51 = load float, float* %50, !alias.scope !21, !noalias !63
  %52 = udiv i32 %linear_index3, 10
  %53 = bitcast [100 x float]* %reduce.53.typed to float*
  %54 = getelementptr inbounds float, float* %53, i32 %52
  %55 = load float, float* %54, !invariant.load !20, !alias.scope !53, !noalias !55
  %56 = fsub float %51, %55
  %57 = call float @__nv_expf(float %56)
  %58 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %59 = getelementptr inbounds float, float* %58, i32 %linear_index3
  store float %57, float* %59, !alias.scope !21, !noalias !64
  br label %fusion.1.in_bounds-after
}

; Function Attrs: nounwind readnone
declare float @__nv_expf(float) #0

define void @reduce_67(i8* align 64 dereferenceable(4000) %alloc4, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %reduce.67.inner.invar_address.reduction_dim.1 = alloca i64
  %reduce.67.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %reduce.67.typed = bitcast i8* %reduce.67.raw to [100 x float]*
  %fusion.1.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.1.typed = bitcast i8* %fusion.1.raw to [100 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %2 = mul nuw nsw i32 %0, 100
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 100
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 100
  br i1 %4, label %reduce.67.in_bounds-true, label %reduce.67.in_bounds-after

reduce.67.in_bounds-after:                        ; preds = %reduce.67.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce.67.in_bounds-true:                         ; preds = %entry
  %5 = alloca float
  %6 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_30 to float*)
  store float %6, float* %5
  store i64 0, i64* %reduce.67.inner.invar_address.reduction_dim.1
  br label %reduce.67.inner.loop_header.reduction_dim.1

reduce.67.inner.loop_header.reduction_dim.1:      ; preds = %reduce.67.inner.loop_body.reduction_dim.1, %reduce.67.in_bounds-true
  %reduce.67.inner.indvar.reduction_dim.1 = load i64, i64* %reduce.67.inner.invar_address.reduction_dim.1
  %7 = icmp uge i64 %reduce.67.inner.indvar.reduction_dim.1, 10
  br i1 %7, label %reduce.67.inner.loop_exit.reduction_dim.1, label %reduce.67.inner.loop_body.reduction_dim.1

reduce.67.inner.loop_body.reduction_dim.1:        ; preds = %reduce.67.inner.loop_header.reduction_dim.1
  %8 = getelementptr inbounds [100 x [10 x float]], [100 x [10 x float]]* %fusion.1.typed, i32 0, i32 %3, i64 %reduce.67.inner.indvar.reduction_dim.1
  call void @owlnode57_reduction_63(float* %5, float* %8, float* %5, i8* %temp_buf)
  %invar.inc = add nuw nsw i64 %reduce.67.inner.indvar.reduction_dim.1, 1
  store i64 %invar.inc, i64* %reduce.67.inner.invar_address.reduction_dim.1
  br label %reduce.67.inner.loop_header.reduction_dim.1

reduce.67.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.67.inner.loop_header.reduction_dim.1
  %9 = load float, float* %5
  %10 = bitcast [100 x float]* %reduce.67.typed to float*
  %11 = getelementptr inbounds float, float* %10, i32 %linear_index
  store float %9, float* %11, !alias.scope !53, !noalias !66
  br label %reduce.67.in_bounds-after
}

define internal void @owlnode57_reduction_63(float* dereferenceable(4) %x.64.typed, float* dereferenceable(4) %y.65.typed, float* dereferenceable(4) %output_arg, i8* %temp_buffer) {
entry:
  %add.66.typed = alloca float
  %0 = load float, float* %x.64.typed, !alias.scope !67, !noalias !69
  %1 = load float, float* %y.65.typed, !alias.scope !71, !noalias !69
  %2 = fadd float %0, %1
  store float %2, float* %add.66.typed, !alias.scope !69
  %load_ret_value = load float, float* %add.66.typed
  store float %load_ret_value, float* %output_arg
  ret void
}

define void @fusion(i8* align 64 dereferenceable(4000) %alloc4, i8* align 64 dereferenceable(12544016) %temp_buf) {
entry:
  %fusion.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.typed = bitcast i8* %fusion.raw to [100 x [10 x float]]*
  %reduce.67.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %reduce.67.typed = bitcast i8* %reduce.67.raw to [100 x float]*
  %fusion.1.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %fusion.1.typed = bitcast i8* %fusion.1.raw to [100 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %2 = mul nuw nsw i32 %0, 250
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 250
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
  %15 = icmp ult i32 %linear_index_base, 1000
  br i1 %15, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %16 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %17 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %18 = load float, float* %17, !alias.scope !21, !noalias !64
  %19 = udiv i32 %linear_index_base, 10
  %20 = bitcast [100 x float]* %reduce.67.typed to float*
  %21 = getelementptr inbounds float, float* %20, i32 %19
  %22 = load float, float* %21, !invariant.load !20, !alias.scope !53, !noalias !66
  %23 = fdiv float %18, %22
  %24 = bitcast [100 x [10 x float]]* %fusion.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index_base
  store float %23, float* %25, !alias.scope !21, !noalias !53
  %26 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  %28 = load float, float* %27, !alias.scope !21, !noalias !64
  %29 = udiv i32 %linear_index1, 10
  %30 = bitcast [100 x float]* %reduce.67.typed to float*
  %31 = getelementptr inbounds float, float* %30, i32 %29
  %32 = load float, float* %31, !invariant.load !20, !alias.scope !53, !noalias !66
  %33 = fdiv float %28, %32
  %34 = bitcast [100 x [10 x float]]* %fusion.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index1
  store float %33, float* %35, !alias.scope !21, !noalias !53
  %36 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index2
  %38 = load float, float* %37, !alias.scope !21, !noalias !64
  %39 = udiv i32 %linear_index2, 10
  %40 = bitcast [100 x float]* %reduce.67.typed to float*
  %41 = getelementptr inbounds float, float* %40, i32 %39
  %42 = load float, float* %41, !invariant.load !20, !alias.scope !53, !noalias !66
  %43 = fdiv float %38, %42
  %44 = bitcast [100 x [10 x float]]* %fusion.typed to float*
  %45 = getelementptr inbounds float, float* %44, i32 %linear_index2
  store float %43, float* %45, !alias.scope !21, !noalias !53
  %46 = bitcast [100 x [10 x float]]* %fusion.1.typed to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  %48 = load float, float* %47, !alias.scope !21, !noalias !64
  %49 = udiv i32 %linear_index3, 10
  %50 = bitcast [100 x float]* %reduce.67.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %49
  %52 = load float, float* %51, !invariant.load !20, !alias.scope !53, !noalias !66
  %53 = fdiv float %48, %52
  %54 = bitcast [100 x [10 x float]]* %fusion.typed to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index3
  store float %53, float* %55, !alias.scope !21, !noalias !53
  br label %fusion.in_bounds-after
}

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone speculatable }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17}

!0 = !{void (i8*, i8*, i8*)* @fusion_6, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*)* @fusion_6, !"reqntidx", i32 250}
!2 = !{void (i8*, i8*)* @fusion_5, !"kernel", i32 1}
!3 = !{void (i8*, i8*)* @fusion_5, !"reqntidx", i32 1024}
!4 = !{void (i8*, i8*, i8*)* @copy_4, !"kernel", i32 1}
!5 = !{void (i8*, i8*, i8*)* @copy_4, !"reqntidx", i32 200}
!6 = !{void (i8*, i8*)* @fusion_4, !"kernel", i32 1}
!7 = !{void (i8*, i8*)* @fusion_4, !"reqntidx", i32 1024}
!8 = !{void (i8*, i8*)* @fusion_3, !"kernel", i32 1}
!9 = !{void (i8*, i8*)* @fusion_3, !"reqntidx", i32 1024}
!10 = !{void (i8*, i8*)* @reduce_53, !"kernel", i32 1}
!11 = !{void (i8*, i8*)* @reduce_53, !"reqntidx", i32 100}
!12 = !{void (i8*, i8*)* @fusion_1, !"kernel", i32 1}
!13 = !{void (i8*, i8*)* @fusion_1, !"reqntidx", i32 250}
!14 = !{void (i8*, i8*)* @reduce_67, !"kernel", i32 1}
!15 = !{void (i8*, i8*)* @reduce_67, !"reqntidx", i32 100}
!16 = !{void (i8*, i8*)* @fusion, !"kernel", i32 1}
!17 = !{void (i8*, i8*)* @fusion, !"reqntidx", i32 250}
!18 = !{i32 0, i32 1}
!19 = !{i32 0, i32 250}
!20 = !{}
!21 = !{!22}
!22 = !{!"buffer: {index:4, offset:0, size:4000}", !23}
!23 = !{!"XLA global AA domain"}
!24 = !{!25}
!25 = !{!"buffer: {index:19, offset:2508800, size:409600}", !23}
!26 = !{i32 0, i32 20}
!27 = !{i32 0, i32 1024}
!28 = !{!29}
!29 = !{!"buffer: {index:19, offset:0, size:313600}", !23}
!30 = !{!31, !32, !33, !34}
!31 = !{!"buffer: {index:4, offset:0, size:3200}", !23}
!32 = !{!"buffer: {index:19, offset:313600, size:4712}", !23}
!33 = !{!"buffer: {index:19, offset:2508800, size:10035200}", !23}
!34 = !{!"buffer: {index:19, offset:12544000, size:16}", !23}
!35 = !{i32 0, i32 200}
!36 = !{!31}
!37 = !{!29, !32, !33, !34}
!38 = !{i32 0, i32 613}
!39 = !{!40}
!40 = !{!"buffer: {index:19, offset:0, size:2508800}", !23}
!41 = !{!25, !33}
!42 = !{!33}
!43 = !{!40, !32, !34}
!44 = !{!40, !33}
!45 = !{!46}
!46 = !{!"buffer: {index:18, offset:0, size:4}", !23}
!47 = !{!48}
!48 = !{!"buffer: {index:8, offset:0, size:4}", !23}
!49 = !{!50}
!50 = !{!"buffer: {index:11, offset:0, size:4}", !23}
!51 = !{i32 0, i32 25}
!52 = !{i32 0, i32 100}
!53 = !{!54}
!54 = !{!"buffer: {index:19, offset:0, size:400}", !23}
!55 = !{!22, !56}
!56 = !{!"buffer: {index:9, offset:0, size:4}", !23}
!57 = !{!58}
!58 = !{!"buffer: {index:12, offset:0, size:4}", !23}
!59 = !{!60}
!60 = !{!"buffer: {index:14, offset:0, size:4}", !23}
!61 = !{!62}
!62 = !{!"buffer: {index:13, offset:0, size:4}", !23}
!63 = !{!56, !54, !25}
!64 = !{!65, !54}
!65 = !{!"buffer: {index:10, offset:0, size:4}", !23}
!66 = !{!22, !65}
!67 = !{!68}
!68 = !{!"buffer: {index:15, offset:0, size:4}", !23}
!69 = !{!70}
!70 = !{!"buffer: {index:17, offset:0, size:4}", !23}
!71 = !{!72}
!72 = !{!"buffer: {index:16, offset:0, size:4}", !23}
