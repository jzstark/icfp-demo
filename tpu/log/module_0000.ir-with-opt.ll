; ModuleID = 'cluster_0__XlaCompiledKernel_true__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.29'
source_filename = "cluster_0__XlaCompiledKernel_true__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.29"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nounwind
define void @fusion_2(i8* nocapture align 64 dereferenceable(3200) %alloc4, i8* nocapture readonly align 16 dereferenceable(3200) %alloc5) local_unnamed_addr #0 {
entry:
  %alloc56 = addrspacecast i8* %alloc5 to i8 addrspace(1)*
  %alloc44 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %linear_index_base = shl nuw nsw i32 %0, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %1 = bitcast i8 addrspace(1)* %alloc56 to float addrspace(1)*
  %2 = zext i32 %linear_index_base to i64
  %3 = getelementptr inbounds float, float addrspace(1)* %1, i64 %2
  %4 = bitcast float addrspace(1)* %3 to <4 x float> addrspace(1)*
  %5 = load <4 x float>, <4 x float> addrspace(1)* %4, align 16, !invariant.load !8, !noalias !9
  %6 = extractelement <4 x float> %5, i32 0
  %7 = extractelement <4 x float> %5, i32 1
  %8 = extractelement <4 x float> %5, i32 2
  %9 = extractelement <4 x float> %5, i32 3
  %10 = fmul float %6, 0x3FC5D4E900000000
  %11 = fadd float %10, 0xBFB5D4E900000000
  %12 = bitcast i8 addrspace(1)* %alloc44 to float addrspace(1)*
  %13 = getelementptr inbounds float, float addrspace(1)* %12, i64 %2
  %14 = fmul float %7, 0x3FC5D4E900000000
  %15 = fadd float %14, 0xBFB5D4E900000000
  %16 = fmul float %8, 0x3FC5D4E900000000
  %17 = fadd float %16, 0xBFB5D4E900000000
  %18 = fmul float %9, 0x3FC5D4E900000000
  %19 = fadd float %18, 0xBFB5D4E900000000
  %20 = insertelement <4 x float> undef, float %11, i32 0
  %21 = insertelement <4 x float> %20, float %15, i32 1
  %22 = insertelement <4 x float> %21, float %17, i32 2
  %23 = insertelement <4 x float> %22, float %19, i32 3
  %24 = bitcast float addrspace(1)* %13 to <4 x float> addrspace(1)*
  store <4 x float> %23, <4 x float> addrspace(1)* %24, align 16, !alias.scope !9, !noalias !12
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind
declare void @llvm.assume(i1) #0

; Function Attrs: nounwind
define void @fusion_1(i8* nocapture align 64 dereferenceable(40960) %alloc2, i8* nocapture readonly align 16 dereferenceable(40960) %alloc3) local_unnamed_addr #0 {
entry:
  %alloc36 = addrspacecast i8* %alloc3 to i8 addrspace(1)*
  %alloc24 = addrspacecast i8* %alloc2 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3072
  tail call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %3 = icmp ult i32 %linear_index, 2560
  br i1 %3, label %fusion.1.in_bounds-true, label %fusion.1.in_bounds-after

fusion.1.in_bounds-after:                         ; preds = %fusion.1.in_bounds-true, %entry
  ret void

fusion.1.in_bounds-true:                          ; preds = %entry
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %4 = bitcast i8 addrspace(1)* %alloc36 to float addrspace(1)*
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr inbounds float, float addrspace(1)* %4, i64 %5
  %7 = bitcast float addrspace(1)* %6 to <4 x float> addrspace(1)*
  %8 = load <4 x float>, <4 x float> addrspace(1)* %7, align 16, !invariant.load !8, !noalias !18
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = fmul float %9, 0x3FC5D4E900000000
  %14 = fadd float %13, 0xBFB5D4E900000000
  %15 = bitcast i8 addrspace(1)* %alloc24 to float addrspace(1)*
  %16 = getelementptr inbounds float, float addrspace(1)* %15, i64 %5
  %17 = fmul float %10, 0x3FC5D4E900000000
  %18 = fadd float %17, 0xBFB5D4E900000000
  %19 = fmul float %11, 0x3FC5D4E900000000
  %20 = fadd float %19, 0xBFB5D4E900000000
  %21 = fmul float %12, 0x3FC5D4E900000000
  %22 = fadd float %21, 0xBFB5D4E900000000
  %23 = insertelement <4 x float> undef, float %14, i32 0
  %24 = insertelement <4 x float> %23, float %18, i32 1
  %25 = insertelement <4 x float> %24, float %20, i32 2
  %26 = insertelement <4 x float> %25, float %22, i32 3
  %27 = bitcast float addrspace(1)* %16 to <4 x float> addrspace(1)*
  store <4 x float> %26, <4 x float> addrspace(1)* %27, align 16, !alias.scope !18, !noalias !19
  br label %fusion.1.in_bounds-after
}

; Function Attrs: nounwind
define void @fusion(i8* nocapture align 64 dereferenceable(25690112) %alloc0, i8* nocapture readonly align 16 dereferenceable(25690112) %alloc1) local_unnamed_addr #0 {
fusion.in_bounds-after:
  %alloc16 = addrspacecast i8* %alloc1 to i8 addrspace(1)*
  %alloc04 = addrspacecast i8* %alloc0 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1605632
  tail call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index3 = or i32 %linear_index_base, 3
  %3 = bitcast i8 addrspace(1)* %alloc16 to float addrspace(1)*
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %3, i64 %4
  %6 = bitcast float addrspace(1)* %5 to <4 x float> addrspace(1)*
  %7 = load <4 x float>, <4 x float> addrspace(1)* %6, align 16, !invariant.load !8, !noalias !21
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = fmul float %8, 0x3FC5D4E900000000
  %13 = fadd float %12, 0xBFB5D4E900000000
  %14 = bitcast i8 addrspace(1)* %alloc04 to float addrspace(1)*
  %15 = getelementptr inbounds float, float addrspace(1)* %14, i64 %4
  %16 = fmul float %9, 0x3FC5D4E900000000
  %17 = fadd float %16, 0xBFB5D4E900000000
  %18 = fmul float %10, 0x3FC5D4E900000000
  %19 = fadd float %18, 0xBFB5D4E900000000
  %20 = fmul float %11, 0x3FC5D4E900000000
  %21 = fadd float %20, 0xBFB5D4E900000000
  %22 = insertelement <4 x float> undef, float %13, i32 0
  %23 = insertelement <4 x float> %22, float %17, i32 1
  %24 = insertelement <4 x float> %23, float %19, i32 2
  %25 = insertelement <4 x float> %24, float %21, i32 3
  %26 = bitcast float addrspace(1)* %15 to <4 x float> addrspace(1)*
  store <4 x float> %25, <4 x float> addrspace(1)* %26, align 16, !alias.scope !21, !noalias !22
  ret void
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #0

attributes #0 = { nounwind }
attributes #1 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{void (i8*, i8*)* @fusion_2, !"kernel", i32 1}
!1 = !{void (i8*, i8*)* @fusion_2, !"reqntidx", i32 200}
!2 = !{void (i8*, i8*)* @fusion_1, !"kernel", i32 1}
!3 = !{void (i8*, i8*)* @fusion_1, !"reqntidx", i32 1024}
!4 = !{void (i8*, i8*)* @fusion, !"kernel", i32 1}
!5 = !{void (i8*, i8*)* @fusion, !"reqntidx", i32 1024}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
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
