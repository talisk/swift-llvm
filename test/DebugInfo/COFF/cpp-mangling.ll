; RUN: llc -mcpu=core2 -mtriple=i686-pc-win32 -o - -O0 < %s \
; RUN:   | llvm-mc -triple=i686-pc-win32 -filetype=obj \
; RUN:   | llvm-readobj -s -sr -codeview -section-symbols | FileCheck %s

; This LL file was generated by running clang on the following code:
; D:\src.cpp:
;  1 namespace foo {
;  2 int bar(int x) {
;  3   return x * 2;
;  4 }
;  5 }

; CHECK:        ProcStart {
; CHECK:     DisplayName: foo::bar
; CHECK-NEXT:     LinkageName: ?bar@foo@@YAHH@Z

; Function Attrs: nounwind uwtable
define i32 @"\01?bar@foo@@YAHH@Z"(i32 %x) #0 !dbg !4 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !13, metadata !14), !dbg !15
  %0 = load i32, i32* %x.addr, align 4, !dbg !16
  %mul = mul nsw i32 %0, 2, !dbg !17
  ret i32 %mul, !dbg !18
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.9.0 (trunk 257652)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "t2.cpp", directory: "D:\5Csrc\5Cllvm\5Cbuild")
!2 = !{}
!3 = !{!4}
!4 = distinct !DISubprogram(name: "foo::bar", linkageName: "\01?bar@foo@@YAHH@Z", scope: !5, file: !1, line: 2, type: !6, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!5 = !DINamespace(name: "foo", scope: null, file: !1, line: 1)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8}
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"CodeView", i32 1}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"PIC Level", i32 2}
!12 = !{!"clang version 3.9.0 (trunk 257652)"}
!13 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !1, line: 2, type: !8)
!14 = !DIExpression()
!15 = !DILocation(line: 2, column: 13, scope: !4)
!16 = !DILocation(line: 3, column: 10, scope: !4)
!17 = !DILocation(line: 3, column: 12, scope: !4)
!18 = !DILocation(line: 3, column: 3, scope: !4)
