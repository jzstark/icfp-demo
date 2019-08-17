; ModuleID = 'cluster_1__XlaCompiledKernel_true__XlaNumConstantArgs_5__XlaNumResourceArgs_0_.76'
source_filename = "cluster_1__XlaCompiledKernel_true__XlaNumConstantArgs_5__XlaNumResourceArgs_0_.76"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_24 = local_unnamed_addr addrspace(1) constant [4 x i8] c"\00\00\80\FF", align 64
@buffer_for_constant_30 = local_unnamed_addr addrspace(1) constant [4 x i8] zeroinitializer, align 64

; Function Attrs: nounwind
define void @fusion_6(i8* nocapture align 64 dereferenceable(4000) %alloc4, i8* nocapture readonly align 16 dereferenceable(40) %alloc7, i8* nocapture readnone align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc76 = addrspacecast i8* %alloc7 to i8 addrspace(1)*
  %alloc44 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %1 = urem i32 %linear_index3, 10
  %2 = urem i32 %linear_index2, 10
  %3 = urem i32 %linear_index1, 10
  %.lhs.trunc = trunc i32 %linear_index_base to i16
  %4 = urem i16 %.lhs.trunc, 10
  %5 = bitcast i8 addrspace(1)* %alloc76 to float addrspace(1)*
  %6 = zext i16 %4 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %5, i64 %6
  %8 = bitcast float addrspace(1)* %7 to i32 addrspace(1)*
  %9 = load i32, i32 addrspace(1)* %8, align 4, !invariant.load !25, !noalias !26
  %10 = bitcast i8 addrspace(1)* %alloc44 to float addrspace(1)*
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, float addrspace(1)* %10, i64 %11
  %13 = bitcast float addrspace(1)* %12 to i32 addrspace(1)*
  %14 = zext i32 %3 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %5, i64 %14
  %16 = bitcast float addrspace(1)* %15 to i32 addrspace(1)*
  %17 = load i32, i32 addrspace(1)* %16, align 4, !invariant.load !25, !noalias !26
  %18 = getelementptr inbounds float, float addrspace(1)* %12, i64 1
  %19 = zext i32 %2 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %5, i64 %19
  %21 = bitcast float addrspace(1)* %20 to i32 addrspace(1)*
  %22 = load i32, i32 addrspace(1)* %21, align 4, !invariant.load !25, !noalias !26
  %23 = getelementptr inbounds float, float addrspace(1)* %12, i64 2
  %24 = zext i32 %1 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %5, i64 %24
  %26 = bitcast float addrspace(1)* %25 to i32 addrspace(1)*
  %27 = load i32, i32 addrspace(1)* %26, align 4, !invariant.load !25, !noalias !26
  %28 = getelementptr inbounds float, float addrspace(1)* %12, i64 3
  %29 = insertelement <4 x i32> undef, i32 %9, i32 0
  %30 = insertelement <4 x i32> %29, i32 %17, i32 1
  %31 = insertelement <4 x i32> %30, i32 %22, i32 2
  %32 = insertelement <4 x i32> %31, i32 %27, i32 3
  %33 = bitcast i32 addrspace(1)* %13 to <4 x i32> addrspace(1)*
  store <4 x i32> %32, <4 x i32> addrspace(1)* %33, align 16, !alias.scope !26, !noalias !29
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind
declare void @llvm.assume(i1) #0

; Function Attrs: nounwind
define void @fusion_5(i8* nocapture readonly align 16 dereferenceable(313600) %alloc1, i8* nocapture align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf6 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc14 = addrspacecast i8* %alloc1 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20480
  tail call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %3 = icmp ult i32 %linear_index, 19600
  br i1 %3, label %fusion.5.in_bounds-true, label %fusion.5.in_bounds-after

fusion.5.in_bounds-after:                         ; preds = %fusion.5.in_bounds-true, %entry
  ret void

fusion.5.in_bounds-true:                          ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %4 = bitcast i8 addrspace(1)* %alloc14 to float addrspace(1)*
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr inbounds float, float addrspace(1)* %4, i64 %5
  %7 = bitcast float addrspace(1)* %6 to <4 x float> addrspace(1)*
  %8 = load <4 x float>, <4 x float> addrspace(1)* %7, align 16, !invariant.load !25, !noalias !33
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = fmul float %9, 3.906250e-03
  %14 = bitcast i8 addrspace(1)* %temp_buf6 to float addrspace(1)*
  %15 = getelementptr inbounds float, float addrspace(1)* %14, i64 %5
  %16 = fmul float %10, 3.906250e-03
  %17 = fmul float %11, 3.906250e-03
  %18 = fmul float %12, 3.906250e-03
  %19 = insertelement <4 x float> undef, float %13, i32 0
  %20 = insertelement <4 x float> %19, float %16, i32 1
  %21 = insertelement <4 x float> %20, float %17, i32 2
  %22 = insertelement <4 x float> %21, float %18, i32 3
  %23 = bitcast float addrspace(1)* %15 to <4 x float> addrspace(1)*
  store <4 x float> %22, <4 x float> addrspace(1)* %23, align 16, !alias.scope !33, !noalias !35
  br label %fusion.5.in_bounds-after
}

; Function Attrs: nounwind
define void @copy_4(i8* nocapture align 64 dereferenceable(4000) %alloc4, i8* nocapture readonly align 16 dereferenceable(3200) %alloc5, i8* nocapture readnone align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc512 = addrspacecast i8* %alloc5 to i8 addrspace(1)*
  %alloc410 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %arg1.2.typed = bitcast i8 addrspace(1)* %alloc512 to [5 x [5 x [1 x [32 x float]]]] addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %1 = udiv i32 %linear_index3, 25
  %2 = udiv i32 %linear_index3, 5
  %3 = urem i32 %2, 5
  %4 = mul i32 %2, 5
  %5 = sub i32 %linear_index3, %4
  %6 = udiv i32 %linear_index2, 25
  %7 = udiv i32 %linear_index2, 5
  %8 = urem i32 %7, 5
  %9 = mul i32 %7, 5
  %10 = sub i32 %linear_index2, %9
  %11 = udiv i32 %linear_index1, 25
  %12 = udiv i32 %linear_index1, 5
  %13 = urem i32 %12, 5
  %14 = mul i32 %12, 5
  %15 = sub i32 %linear_index1, %14
  %.lhs.trunc = trunc i32 %linear_index_base to i16
  %16 = udiv i16 %.lhs.trunc, 25
  %17 = udiv i16 %.lhs.trunc, 5
  %.lhs.trunc6 = trunc i16 %17 to i8
  %18 = urem i8 %.lhs.trunc6, 5
  %19 = mul i16 %17, 5
  %20 = sub i16 %.lhs.trunc, %19
  %21 = zext i8 %18 to i64
  %22 = zext i16 %20 to i64
  %23 = zext i16 %16 to i64
  %24 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]] addrspace(1)* %arg1.2.typed, i64 0, i64 %21, i64 %22, i64 0, i64 %23
  %25 = bitcast float addrspace(1)* %24 to i32 addrspace(1)*
  %26 = load i32, i32 addrspace(1)* %25, align 4, !invariant.load !25, !noalias !41
  %27 = bitcast i8 addrspace(1)* %alloc410 to float addrspace(1)*
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, float addrspace(1)* %27, i64 %28
  %30 = bitcast float addrspace(1)* %29 to i32 addrspace(1)*
  %31 = zext i32 %13 to i64
  %32 = zext i32 %15 to i64
  %33 = zext i32 %11 to i64
  %34 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]] addrspace(1)* %arg1.2.typed, i64 0, i64 %31, i64 %32, i64 0, i64 %33
  %35 = bitcast float addrspace(1)* %34 to i32 addrspace(1)*
  %36 = load i32, i32 addrspace(1)* %35, align 4, !invariant.load !25, !noalias !41
  %37 = getelementptr inbounds float, float addrspace(1)* %29, i64 1
  %38 = zext i32 %8 to i64
  %39 = zext i32 %10 to i64
  %40 = zext i32 %6 to i64
  %41 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]] addrspace(1)* %arg1.2.typed, i64 0, i64 %38, i64 %39, i64 0, i64 %40
  %42 = bitcast float addrspace(1)* %41 to i32 addrspace(1)*
  %43 = load i32, i32 addrspace(1)* %42, align 4, !invariant.load !25, !noalias !41
  %44 = getelementptr inbounds float, float addrspace(1)* %29, i64 2
  %45 = zext i32 %3 to i64
  %46 = zext i32 %5 to i64
  %47 = zext i32 %1 to i64
  %48 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]] addrspace(1)* %arg1.2.typed, i64 0, i64 %45, i64 %46, i64 0, i64 %47
  %49 = bitcast float addrspace(1)* %48 to i32 addrspace(1)*
  %50 = load i32, i32 addrspace(1)* %49, align 4, !invariant.load !25, !noalias !41
  %51 = getelementptr inbounds float, float addrspace(1)* %29, i64 3
  %52 = insertelement <4 x i32> undef, i32 %26, i32 0
  %53 = insertelement <4 x i32> %52, i32 %36, i32 1
  %54 = insertelement <4 x i32> %53, i32 %43, i32 2
  %55 = insertelement <4 x i32> %54, i32 %50, i32 3
  %56 = bitcast i32 addrspace(1)* %30 to <4 x i32> addrspace(1)*
  store <4 x i32> %55, <4 x i32> addrspace(1)* %56, align 16, !alias.scope !41, !noalias !42
  ret void
}

; Function Attrs: nounwind
define void @fusion_4(i8* nocapture readonly align 16 dereferenceable(128) %alloc6, i8* nocapture align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf62 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc660 = addrspacecast i8* %alloc6 to i8 addrspace(1)*
  %get-tuple-element.1.raw = getelementptr inbounds i8, i8 addrspace(1)* %temp_buf62, i64 2508800
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 627712
  tail call void @llvm.assume(i1 %linear_index_in_range)
  %3 = urem i32 %linear_index, 6272
  %4 = icmp ult i32 %linear_index, 627200
  br i1 %4, label %fusion.4.in_bounds-true, label %fusion.4.in_bounds-after

fusion.4.in_bounds-after:                         ; preds = %reduce-window.0.loop_exit.window.1, %entry
  ret void

fusion.4.in_bounds-true:                          ; preds = %entry
  %5 = and i32 %3, 31
  %6 = lshr i32 %3, 5
  %7 = urem i32 %6, 14
  %8 = udiv i32 %3, 448
  %9 = mul nuw nsw i32 %8, 14
  %10 = mul nuw nsw i32 %5, 196
  %11 = sub nsw i32 %linear_index, %3
  %12 = add nsw i32 %9, %11
  %13 = add nsw i32 %12, %7
  %14 = add nsw i32 %13, %10
  %15 = udiv i32 %14, 14
  %16 = mul i32 %15, 14
  %17 = sub i32 %14, %16
  %18 = urem i32 %15, 14
  %19 = udiv i32 %14, 6272
  %20 = shl nuw nsw i32 %18, 1
  %21 = shl nuw nsw i32 %17, 1
  %22 = icmp ult i32 %14, 627200
  %23 = zext i32 %19 to i64
  br i1 %22, label %in_bounds-after.us.us.us, label %reduce-window.0.loop_exit.window.1

reduce-window.0.loop_exit.window.3.us.us:         ; preds = %in_bounds-after.us.us.us, %in_bounds-true.us.us.us.1
  %reduce_window_accum_ptr.4.us.us.us.1 = phi float [ %49, %in_bounds-true.us.us.us.1 ], [ %38, %in_bounds-after.us.us.us ]
  %24 = or i32 %20, 1
  %25 = icmp ult i32 %24, 28
  br i1 %25, label %in_bounds-after.us.us.us.159, label %reduce-window.0.loop_exit.window.1

in_bounds-after.us.us.us:                         ; preds = %fusion.4.in_bounds-true
  %26 = bitcast i8 addrspace(1)* %alloc660 to [32 x float] addrspace(1)*
  %27 = bitcast i8 addrspace(1)* %get-tuple-element.1.raw to [100 x [32 x [28 x [28 x float]]]] addrspace(1)*
  %28 = udiv i32 %14, 196
  %29 = and i32 %28, 31
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds [32 x float], [32 x float] addrspace(1)* %26, i64 0, i64 %30
  %32 = zext i32 %20 to i64
  %33 = zext i32 %21 to i64
  %34 = getelementptr inbounds [100 x [32 x [28 x [28 x float]]]], [100 x [32 x [28 x [28 x float]]]] addrspace(1)* %27, i64 0, i64 %23, i64 %30, i64 %32, i64 %33
  %35 = load float, float addrspace(1)* %34, align 8, !invariant.load !25, !alias.scope !44, !noalias !45
  %36 = load float, float addrspace(1)* %31, align 4, !invariant.load !25, !noalias !47
  %37 = fadd float %35, %36
  %38 = tail call float @llvm.maxnum.f32(float %37, float 0xFFF0000000000000) #0
  %39 = or i32 %21, 1
  %40 = icmp ult i32 %39, 28
  br i1 %40, label %in_bounds-true.us.us.us.1, label %reduce-window.0.loop_exit.window.3.us.us

reduce-window.0.loop_exit.window.1:               ; preds = %in_bounds-after.us.us.us.159, %in_bounds-true.us.us.us.1.1, %reduce-window.0.loop_exit.window.3.us.us, %fusion.4.in_bounds-true
  %reduce_window_accum_ptr.1.lcssa = phi float [ 0xFFF0000000000000, %fusion.4.in_bounds-true ], [ %reduce_window_accum_ptr.4.us.us.us.1, %reduce-window.0.loop_exit.window.3.us.us ], [ %59, %in_bounds-true.us.us.us.1.1 ], [ %54, %in_bounds-after.us.us.us.159 ]
  %41 = tail call float @llvm.maxnum.f32(float %reduce_window_accum_ptr.1.lcssa, float 0.000000e+00)
  %42 = bitcast i8 addrspace(1)* %temp_buf62 to float addrspace(1)*
  %43 = zext i32 %linear_index to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %42, i64 %43
  store float %41, float addrspace(1)* %44, align 4, !alias.scope !48, !noalias !49
  br label %fusion.4.in_bounds-after

in_bounds-true.us.us.us.1:                        ; preds = %in_bounds-after.us.us.us
  %45 = bitcast float addrspace(1)* %34 to i8 addrspace(1)*
  %sunkaddr = getelementptr inbounds i8, i8 addrspace(1)* %45, i64 4
  %46 = bitcast i8 addrspace(1)* %sunkaddr to float addrspace(1)*
  %47 = load float, float addrspace(1)* %46, align 4, !invariant.load !25, !alias.scope !44, !noalias !45
  %48 = fadd float %47, %36
  %49 = tail call float @llvm.maxnum.f32(float %38, float %48) #0
  br label %reduce-window.0.loop_exit.window.3.us.us

in_bounds-after.us.us.us.159:                     ; preds = %reduce-window.0.loop_exit.window.3.us.us
  %50 = icmp ult i32 %39, 28
  %51 = getelementptr inbounds float, float addrspace(1)* %34, i64 28
  %52 = load float, float addrspace(1)* %51, align 8, !invariant.load !25, !alias.scope !44, !noalias !45
  %53 = fadd float %52, %36
  %54 = tail call float @llvm.maxnum.f32(float %reduce_window_accum_ptr.4.us.us.us.1, float %53) #0
  br i1 %50, label %in_bounds-true.us.us.us.1.1, label %reduce-window.0.loop_exit.window.1

in_bounds-true.us.us.us.1.1:                      ; preds = %in_bounds-after.us.us.us.159
  %55 = bitcast float addrspace(1)* %34 to i8 addrspace(1)*
  %sunkaddr64 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 116
  %56 = bitcast i8 addrspace(1)* %sunkaddr64 to float addrspace(1)*
  %57 = load float, float addrspace(1)* %56, align 4, !invariant.load !25, !alias.scope !44, !noalias !45
  %58 = fadd float %57, %36
  %59 = tail call float @llvm.maxnum.f32(float %54, float %58) #0
  br label %reduce-window.0.loop_exit.window.1
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: nounwind
define void @fusion_3(i8* nocapture readonly align 16 dereferenceable(4096) %alloc3, i8* nocapture align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
fusion.3.in_bounds-after:
  %temp_buf6 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc34 = addrspacecast i8* %alloc3 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 25600
  tail call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %3 = and i32 %linear_index3, 1023
  %4 = and i32 %linear_index2, 1022
  %5 = and i32 %linear_index1, 1021
  %6 = and i32 %linear_index_base, 1020
  %dot.35.raw = getelementptr inbounds i8, i8 addrspace(1)* %temp_buf6, i64 2508800
  %7 = bitcast i8 addrspace(1)* %alloc34 to float addrspace(1)*
  %8 = zext i32 %6 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %7, i64 %8
  %10 = bitcast float addrspace(1)* %9 to <4 x float> addrspace(1)*
  %11 = load <4 x float>, <4 x float> addrspace(1)* %10, align 16, !invariant.load !25, !noalias !29
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = bitcast i8 addrspace(1)* %dot.35.raw to float addrspace(1)*
  %17 = zext i32 %linear_index_base to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %16, i64 %17
  %19 = bitcast float addrspace(1)* %18 to <4 x float> addrspace(1)*
  %20 = load <4 x float>, <4 x float> addrspace(1)* %19, align 16, !alias.scope !29, !noalias !48
  %21 = extractelement <4 x float> %20, i32 0
  %22 = extractelement <4 x float> %20, i32 1
  %23 = extractelement <4 x float> %20, i32 2
  %24 = extractelement <4 x float> %20, i32 3
  %25 = fadd float %12, %21
  %26 = tail call float @llvm.maxnum.f32(float %25, float 0.000000e+00)
  %27 = fadd float %13, %22
  %28 = tail call float @llvm.maxnum.f32(float %27, float 0.000000e+00)
  %29 = fadd float %14, %23
  %30 = tail call float @llvm.maxnum.f32(float %29, float 0.000000e+00)
  %31 = fadd float %15, %24
  %32 = tail call float @llvm.maxnum.f32(float %31, float 0.000000e+00)
  %33 = insertelement <4 x float> undef, float %26, i32 0
  %34 = insertelement <4 x float> %33, float %28, i32 1
  %35 = insertelement <4 x float> %34, float %30, i32 2
  %36 = insertelement <4 x float> %35, float %32, i32 3
  store <4 x float> %36, <4 x float> addrspace(1)* %19, align 16, !alias.scope !29, !noalias !26
  ret void
}

; Function Attrs: nounwind
define void @reduce_53(i8* nocapture readonly align 64 dereferenceable(4000) %alloc4, i8* nocapture align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf5 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc43 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %fusion.2.typed = bitcast i8 addrspace(1)* %alloc43 to [100 x [10 x float]] addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds [100 x [10 x float]], [100 x [10 x float]] addrspace(1)* %fusion.2.typed, i64 0, i64 %1, i64 0
  %3 = bitcast float addrspace(1)* %2 to <2 x float> addrspace(1)*
  %4 = load <2 x float>, <2 x float> addrspace(1)* %3, align 8, !alias.scope !52, !noalias !54
  %.val17 = extractelement <2 x float> %4, i32 0
  %.val1.18 = extractelement <2 x float> %4, i32 1
  %5 = tail call float @llvm.maxnum.f32(float %.val17, float 0xFFF0000000000000) #0
  %6 = tail call float @llvm.maxnum.f32(float %5, float %.val1.18) #0
  %7 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %8 = bitcast float addrspace(1)* %7 to <2 x float> addrspace(1)*
  %9 = load <2 x float>, <2 x float> addrspace(1)* %8, align 8, !alias.scope !52, !noalias !54
  %.val1.29 = extractelement <2 x float> %9, i32 0
  %.val1.310 = extractelement <2 x float> %9, i32 1
  %10 = tail call float @llvm.maxnum.f32(float %6, float %.val1.29) #0
  %11 = tail call float @llvm.maxnum.f32(float %10, float %.val1.310) #0
  %12 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %13 = bitcast float addrspace(1)* %12 to <2 x float> addrspace(1)*
  %14 = load <2 x float>, <2 x float> addrspace(1)* %13, align 8, !alias.scope !52, !noalias !54
  %.val1.411 = extractelement <2 x float> %14, i32 0
  %.val1.512 = extractelement <2 x float> %14, i32 1
  %15 = tail call float @llvm.maxnum.f32(float %11, float %.val1.411) #0
  %16 = tail call float @llvm.maxnum.f32(float %15, float %.val1.512) #0
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %18 = bitcast float addrspace(1)* %17 to <2 x float> addrspace(1)*
  %19 = load <2 x float>, <2 x float> addrspace(1)* %18, align 8, !alias.scope !52, !noalias !54
  %.val1.613 = extractelement <2 x float> %19, i32 0
  %.val1.714 = extractelement <2 x float> %19, i32 1
  %20 = tail call float @llvm.maxnum.f32(float %16, float %.val1.613) #0
  %21 = tail call float @llvm.maxnum.f32(float %20, float %.val1.714) #0
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %23 = bitcast float addrspace(1)* %22 to <2 x float> addrspace(1)*
  %24 = load <2 x float>, <2 x float> addrspace(1)* %23, align 8, !alias.scope !52, !noalias !54
  %.val1.815 = extractelement <2 x float> %24, i32 0
  %.val1.916 = extractelement <2 x float> %24, i32 1
  %25 = tail call float @llvm.maxnum.f32(float %21, float %.val1.815) #0
  %26 = tail call float @llvm.maxnum.f32(float %25, float %.val1.916) #0
  %27 = bitcast i8 addrspace(1)* %temp_buf5 to float addrspace(1)*
  %28 = getelementptr inbounds float, float addrspace(1)* %27, i64 %1
  store float %26, float addrspace(1)* %28, align 4, !alias.scope !56, !noalias !58
  ret void
}

; Function Attrs: nounwind
define void @fusion_1(i8* nocapture align 64 dereferenceable(4000) %alloc4, i8* nocapture readonly align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf12 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc410 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index1 = or i32 %linear_index_base, 1
  %1 = bitcast i8 addrspace(1)* %alloc410 to float addrspace(1)*
  %2 = zext i32 %linear_index_base to i64
  %3 = getelementptr inbounds float, float addrspace(1)* %1, i64 %2
  %4 = bitcast float addrspace(1)* %3 to <4 x float> addrspace(1)*
  %5 = load <4 x float>, <4 x float> addrspace(1)* %4, align 16, !alias.scope !26, !noalias !60
  %6 = extractelement <4 x float> %5, i32 0
  %7 = extractelement <4 x float> %5, i32 1
  %8 = extractelement <4 x float> %5, i32 2
  %9 = extractelement <4 x float> %5, i32 3
  %.lhs.trunc = trunc i32 %linear_index_base to i16
  %10 = udiv i16 %.lhs.trunc, 10
  %11 = bitcast i8 addrspace(1)* %temp_buf12 to float addrspace(1)*
  %12 = zext i16 %10 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %11, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !invariant.load !25, !alias.scope !56, !noalias !58
  %15 = fsub float %6, %14
  %16 = fmul float %15, 0x3FF7154760000000
  %17 = tail call float @llvm.trunc.f32(float %16) #0
  %18 = tail call float @llvm.fma.f32(float %17, float 0xBFE62E4000000000, float %15) #0
  %19 = tail call float @llvm.fma.f32(float %17, float 0xBEB7F7D1C0000000, float %18) #0
  %20 = fmul float %19, 0x3FF7154760000000
  %21 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %20) #0
  %22 = fadd float %17, 0.000000e+00
  %23 = tail call float @llvm.nvvm.ex2.approx.f(float %22) #0
  %24 = fmul float %21, %23
  %25 = fcmp olt float %15, -1.050000e+02
  %z.0.i.i = select i1 %25, float 0.000000e+00, float %24
  %26 = fcmp ogt float %15, 1.050000e+02
  %z.1.i.i = select i1 %26, float 0x7FF0000000000000, float %z.0.i.i
  %27 = fsub float %7, %14
  %28 = fmul float %27, 0x3FF7154760000000
  %29 = tail call float @llvm.trunc.f32(float %28) #0
  %30 = tail call float @llvm.fma.f32(float %29, float 0xBFE62E4000000000, float %27) #0
  %31 = tail call float @llvm.fma.f32(float %29, float 0xBEB7F7D1C0000000, float %30) #0
  %32 = fmul float %31, 0x3FF7154760000000
  %33 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %32) #0
  %34 = fadd float %29, 0.000000e+00
  %35 = tail call float @llvm.nvvm.ex2.approx.f(float %34) #0
  %36 = fmul float %33, %35
  %37 = fcmp olt float %27, -1.050000e+02
  %z.0.i.i8 = select i1 %37, float 0.000000e+00, float %36
  %38 = fcmp ogt float %27, 1.050000e+02
  %z.1.i.i9 = select i1 %38, float 0x7FF0000000000000, float %z.0.i.i8
  %39 = udiv i32 %linear_index2, 10
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %11, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !invariant.load !25, !alias.scope !56, !noalias !58
  %43 = fsub float %8, %42
  %44 = fmul float %43, 0x3FF7154760000000
  %45 = tail call float @llvm.trunc.f32(float %44) #0
  %46 = tail call float @llvm.fma.f32(float %45, float 0xBFE62E4000000000, float %43) #0
  %47 = tail call float @llvm.fma.f32(float %45, float 0xBEB7F7D1C0000000, float %46) #0
  %48 = fmul float %47, 0x3FF7154760000000
  %49 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %48) #0
  %50 = fadd float %45, 0.000000e+00
  %51 = tail call float @llvm.nvvm.ex2.approx.f(float %50) #0
  %52 = fmul float %49, %51
  %53 = fcmp olt float %43, -1.050000e+02
  %z.0.i.i6 = select i1 %53, float 0.000000e+00, float %52
  %54 = fcmp ogt float %43, 1.050000e+02
  %z.1.i.i7 = select i1 %54, float 0x7FF0000000000000, float %z.0.i.i6
  %55 = udiv i32 %linear_index3, 10
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %11, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !invariant.load !25, !alias.scope !56, !noalias !58
  %59 = fsub float %9, %58
  %60 = fmul float %59, 0x3FF7154760000000
  %61 = tail call float @llvm.trunc.f32(float %60) #0
  %62 = tail call float @llvm.fma.f32(float %61, float 0xBFE62E4000000000, float %59) #0
  %63 = tail call float @llvm.fma.f32(float %61, float 0xBEB7F7D1C0000000, float %62) #0
  %64 = fmul float %63, 0x3FF7154760000000
  %65 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %64) #0
  %66 = fadd float %61, 0.000000e+00
  %67 = tail call float @llvm.nvvm.ex2.approx.f(float %66) #0
  %68 = fmul float %65, %67
  %69 = fcmp olt float %59, -1.050000e+02
  %z.0.i.i4 = select i1 %69, float 0.000000e+00, float %68
  %70 = fcmp ogt float %59, 1.050000e+02
  %z.1.i.i5 = select i1 %70, float 0x7FF0000000000000, float %z.0.i.i4
  %71 = insertelement <4 x float> undef, float %z.1.i.i, i32 0
  %72 = insertelement <4 x float> %71, float %z.1.i.i9, i32 1
  %73 = insertelement <4 x float> %72, float %z.1.i.i7, i32 2
  %74 = insertelement <4 x float> %73, float %z.1.i.i5, i32 3
  store <4 x float> %74, <4 x float> addrspace(1)* %4, align 16, !alias.scope !26, !noalias !61
  ret void
}

; Function Attrs: nounwind
define void @reduce_67(i8* nocapture readonly align 64 dereferenceable(4000) %alloc4, i8* nocapture align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf5 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc43 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %fusion.1.typed = bitcast i8 addrspace(1)* %alloc43 to [100 x [10 x float]] addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds [100 x [10 x float]], [100 x [10 x float]] addrspace(1)* %fusion.1.typed, i64 0, i64 %1, i64 0
  %3 = bitcast float addrspace(1)* %2 to <2 x float> addrspace(1)*
  %4 = load <2 x float>, <2 x float> addrspace(1)* %3, align 8, !alias.scope !63, !noalias !65
  %.val17 = extractelement <2 x float> %4, i32 0
  %.val1.18 = extractelement <2 x float> %4, i32 1
  %5 = fadd float %.val17, 0.000000e+00
  %6 = fadd float %5, %.val1.18
  %7 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %8 = bitcast float addrspace(1)* %7 to <2 x float> addrspace(1)*
  %9 = load <2 x float>, <2 x float> addrspace(1)* %8, align 8, !alias.scope !63, !noalias !65
  %.val1.29 = extractelement <2 x float> %9, i32 0
  %.val1.310 = extractelement <2 x float> %9, i32 1
  %10 = fadd float %6, %.val1.29
  %11 = fadd float %10, %.val1.310
  %12 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %13 = bitcast float addrspace(1)* %12 to <2 x float> addrspace(1)*
  %14 = load <2 x float>, <2 x float> addrspace(1)* %13, align 8, !alias.scope !63, !noalias !65
  %.val1.411 = extractelement <2 x float> %14, i32 0
  %.val1.512 = extractelement <2 x float> %14, i32 1
  %15 = fadd float %11, %.val1.411
  %16 = fadd float %15, %.val1.512
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %18 = bitcast float addrspace(1)* %17 to <2 x float> addrspace(1)*
  %19 = load <2 x float>, <2 x float> addrspace(1)* %18, align 8, !alias.scope !63, !noalias !65
  %.val1.613 = extractelement <2 x float> %19, i32 0
  %.val1.714 = extractelement <2 x float> %19, i32 1
  %20 = fadd float %16, %.val1.613
  %21 = fadd float %20, %.val1.714
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %23 = bitcast float addrspace(1)* %22 to <2 x float> addrspace(1)*
  %24 = load <2 x float>, <2 x float> addrspace(1)* %23, align 8, !alias.scope !63, !noalias !65
  %.val1.815 = extractelement <2 x float> %24, i32 0
  %.val1.916 = extractelement <2 x float> %24, i32 1
  %25 = fadd float %21, %.val1.815
  %26 = fadd float %25, %.val1.916
  %27 = bitcast i8 addrspace(1)* %temp_buf5 to float addrspace(1)*
  %28 = getelementptr inbounds float, float addrspace(1)* %27, i64 %1
  store float %26, float addrspace(1)* %28, align 4, !alias.scope !56, !noalias !67
  ret void
}

; Function Attrs: nounwind
define void @fusion(i8* nocapture align 64 dereferenceable(4000) %alloc4, i8* nocapture readonly align 64 dereferenceable(12544016) %temp_buf) local_unnamed_addr #0 {
entry:
  %temp_buf6 = addrspacecast i8* %temp_buf to i8 addrspace(1)*
  %alloc44 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index1 = or i32 %linear_index_base, 1
  %1 = bitcast i8 addrspace(1)* %alloc44 to float addrspace(1)*
  %2 = zext i32 %linear_index_base to i64
  %3 = getelementptr inbounds float, float addrspace(1)* %1, i64 %2
  %4 = bitcast float addrspace(1)* %3 to <4 x float> addrspace(1)*
  %5 = load <4 x float>, <4 x float> addrspace(1)* %4, align 16, !alias.scope !26, !noalias !61
  %6 = extractelement <4 x float> %5, i32 0
  %7 = extractelement <4 x float> %5, i32 1
  %8 = extractelement <4 x float> %5, i32 2
  %9 = extractelement <4 x float> %5, i32 3
  %.lhs.trunc = trunc i32 %linear_index_base to i16
  %10 = udiv i16 %.lhs.trunc, 10
  %11 = bitcast i8 addrspace(1)* %temp_buf6 to float addrspace(1)*
  %12 = zext i16 %10 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %11, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !invariant.load !25, !alias.scope !56, !noalias !67
  %15 = fdiv float %6, %14
  %16 = fdiv float %7, %14
  %17 = udiv i32 %linear_index2, 10
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %11, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !invariant.load !25, !alias.scope !56, !noalias !67
  %21 = fdiv float %8, %20
  %22 = udiv i32 %linear_index3, 10
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %11, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !invariant.load !25, !alias.scope !56, !noalias !67
  %26 = fdiv float %9, %25
  %27 = insertelement <4 x float> undef, float %15, i32 0
  %28 = insertelement <4 x float> %27, float %16, i32 1
  %29 = insertelement <4 x float> %28, float %21, i32 2
  %30 = insertelement <4 x float> %29, float %26, i32 3
  store <4 x float> %30, <4 x float> addrspace(1)* %4, align 16, !alias.scope !26, !noalias !56
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.f(float) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.trunc.f32(float) #2

; Function Attrs: nounwind readnone speculatable
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #0

attributes #0 = { nounwind }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone speculatable }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !18, !20, !20, !20, !20, !21, !21, !20}
!nvvmir.version = !{!22}
!llvm.module.flags = !{!23}

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
!18 = !{null, !"align", i32 8}
!19 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!20 = !{null, !"align", i32 16}
!21 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!22 = !{i32 1, i32 4}
!23 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!24 = !{i32 0, i32 250}
!25 = !{}
!26 = !{!27}
!27 = !{!"buffer: {index:4, offset:0, size:4000}", !28}
!28 = !{!"XLA global AA domain"}
!29 = !{!30}
!30 = !{!"buffer: {index:19, offset:2508800, size:409600}", !28}
!31 = !{i32 0, i32 20}
!32 = !{i32 0, i32 1024}
!33 = !{!34}
!34 = !{!"buffer: {index:19, offset:0, size:313600}", !28}
!35 = !{!36, !37, !38, !39}
!36 = !{!"buffer: {index:4, offset:0, size:3200}", !28}
!37 = !{!"buffer: {index:19, offset:313600, size:4712}", !28}
!38 = !{!"buffer: {index:19, offset:2508800, size:10035200}", !28}
!39 = !{!"buffer: {index:19, offset:12544000, size:16}", !28}
!40 = !{i32 0, i32 200}
!41 = !{!36}
!42 = !{!34, !37, !38, !39}
!43 = !{i32 0, i32 613}
!44 = !{!38}
!45 = !{!46, !37, !39}
!46 = !{!"buffer: {index:19, offset:0, size:2508800}", !28}
!47 = !{!46, !38}
!48 = !{!46}
!49 = !{!30, !38}
!50 = !{i32 0, i32 25}
!51 = !{i32 0, i32 100}
!52 = !{!53}
!53 = !{!"buffer: {index:13, offset:0, size:4}", !28}
!54 = !{!55}
!55 = !{!"buffer: {index:14, offset:0, size:4}", !28}
!56 = !{!57}
!57 = !{!"buffer: {index:19, offset:0, size:400}", !28}
!58 = !{!27, !59}
!59 = !{!"buffer: {index:9, offset:0, size:4}", !28}
!60 = !{!59, !57, !30}
!61 = !{!62, !57}
!62 = !{!"buffer: {index:10, offset:0, size:4}", !28}
!63 = !{!64}
!64 = !{!"buffer: {index:16, offset:0, size:4}", !28}
!65 = !{!66}
!66 = !{!"buffer: {index:17, offset:0, size:4}", !28}
!67 = !{!27, !62}
