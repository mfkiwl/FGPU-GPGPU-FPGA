; ModuleID = 'median.cl'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-uknown"

; Function Attrs: nounwind
define void @median(i32* nocapture readonly %in, i32* nocapture %out) #0 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 1) #1, !srcloc !7
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 1) #1, !srcloc !8
  %add.i = add nsw i32 %1, %0
  %2 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #1, !srcloc !7
  %3 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #1, !srcloc !8
  %add.i.2153 = add nsw i32 %3, %2
  %4 = tail call i32 asm sideeffect "size $0, $1", "=r,I,~{$1}"(i32 0) #1, !srcloc !9
  %cmp = icmp eq i32 %add.i, 0
  %conv = zext i1 %cmp to i32
  %cmp3 = icmp eq i32 %add.i.2153, 0
  %conv4 = zext i1 %cmp3 to i32
  %sub = add i32 %4, -2
  %cmp5 = icmp ugt i32 %add.i, %sub
  %conv6 = zext i1 %cmp5 to i32
  %cmp8 = icmp ugt i32 %add.i.2153, %sub
  %conv9 = zext i1 %cmp8 to i32
  %or10 = or i32 %conv4, %conv
  %or = or i32 %or10, %conv9
  %or13 = or i32 %or, %conv6
  %tobool14 = icmp eq i32 %or13, 0
  br i1 %tobool14, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %sub17 = add i32 %add.i, -1
  %mul = mul i32 %4, %sub17
  %add = add i32 %mul, %add.i.2153
  %sub18 = add i32 %add, -1
  %arrayidx = getelementptr inbounds i32, i32* %in, i32 %sub18
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul19 = mul i32 %4, %add.i
  %add20 = add i32 %mul19, %add.i.2153
  %sub21 = add i32 %add20, -1
  %arrayidx22 = getelementptr inbounds i32, i32* %in, i32 %sub21
  %6 = load i32, i32* %arrayidx22, align 4, !tbaa !10
  %add23 = add i32 %add.i, 1
  %mul24 = mul i32 %4, %add23
  %add25 = add i32 %mul24, %add.i.2153
  %sub26 = add i32 %add25, -1
  %arrayidx27 = getelementptr inbounds i32, i32* %in, i32 %sub26
  %7 = load i32, i32* %arrayidx27, align 4, !tbaa !10
  %arrayidx31 = getelementptr inbounds i32, i32* %in, i32 %add
  %8 = load i32, i32* %arrayidx31, align 4, !tbaa !10
  %arrayidx34 = getelementptr inbounds i32, i32* %in, i32 %add20
  %9 = load i32, i32* %arrayidx34, align 4, !tbaa !10
  %arrayidx38 = getelementptr inbounds i32, i32* %in, i32 %add25
  %10 = load i32, i32* %arrayidx38, align 4, !tbaa !10
  %add42 = add i32 %add, 1
  %arrayidx43 = getelementptr inbounds i32, i32* %in, i32 %add42
  %11 = load i32, i32* %arrayidx43, align 4, !tbaa !10
  %add46 = add i32 %add20, 1
  %arrayidx47 = getelementptr inbounds i32, i32* %in, i32 %add46
  %12 = load i32, i32* %arrayidx47, align 4, !tbaa !10
  %add51 = add i32 %add25, 1
  %arrayidx52 = getelementptr inbounds i32, i32* %in, i32 %add51
  %13 = load i32, i32* %arrayidx52, align 4, !tbaa !10
  %and = and i32 %5, 255
  %and53 = and i32 %8, 255
  %and54 = and i32 %11, 255
  %and55 = and i32 %6, 255
  %and56 = and i32 %9, 255
  %and57 = and i32 %12, 255
  %and58 = and i32 %7, 255
  %and59 = and i32 %10, 255
  %and60 = and i32 %13, 255
  %cmp61 = icmp ugt i32 %and, %and53
  %conv62 = zext i1 %cmp61 to i32
  %cmp63 = icmp ugt i32 %and, %and54
  %conv64 = zext i1 %cmp63 to i32
  %cmp65 = icmp ugt i32 %and53, %and54
  %conv66 = zext i1 %cmp65 to i32
  %add67 = add nuw nsw i32 %conv64, %conv62
  %lnot.ext = xor i32 %conv62, 1
  %add69 = add nuw nsw i32 %conv66, %lnot.ext
  %lnot.ext72 = xor i32 %conv64, 1
  %lnot.ext75 = xor i32 %conv66, 1
  %add76 = add nuw nsw i32 %lnot.ext72, %lnot.ext75
  %cmp77 = icmp eq i32 %add69, 0
  %cond = select i1 %cmp77, i32 %and53, i32 %and
  %cmp79 = icmp eq i32 %add76, 0
  %cond84 = select i1 %cmp79, i32 %and54, i32 %cond
  %cmp85 = icmp eq i32 %add67, 1
  %cond90 = select i1 %cmp85, i32 %and, i32 %and53
  %cmp91 = icmp eq i32 %add76, 1
  %cond96 = select i1 %cmp91, i32 %and54, i32 %cond90
  %cmp97 = icmp eq i32 %add67, 2
  %cond102 = select i1 %cmp97, i32 %and, i32 %and54
  %cmp103 = icmp eq i32 %add69, 2
  %cond108 = select i1 %cmp103, i32 %and53, i32 %cond102
  %cmp117 = icmp ugt i32 %and55, %and56
  %conv118 = zext i1 %cmp117 to i32
  %cmp119 = icmp ugt i32 %and55, %and57
  %conv120 = zext i1 %cmp119 to i32
  %cmp121 = icmp ugt i32 %and56, %and57
  %conv122 = zext i1 %cmp121 to i32
  %add123 = add nuw nsw i32 %conv120, %conv118
  %lnot.ext126 = xor i32 %conv118, 1
  %add127 = add nuw nsw i32 %conv122, %lnot.ext126
  %lnot.ext130 = xor i32 %conv120, 1
  %lnot.ext133 = xor i32 %conv122, 1
  %add134 = add nuw nsw i32 %lnot.ext130, %lnot.ext133
  %cmp135 = icmp eq i32 %add127, 0
  %cond140 = select i1 %cmp135, i32 %and56, i32 %and55
  %cmp141 = icmp eq i32 %add134, 0
  %cond146 = select i1 %cmp141, i32 %and57, i32 %cond140
  %cmp147 = icmp eq i32 %add123, 1
  %cond152 = select i1 %cmp147, i32 %and55, i32 %and56
  %cmp153 = icmp eq i32 %add134, 1
  %cond158 = select i1 %cmp153, i32 %and57, i32 %cond152
  %cmp159 = icmp eq i32 %add123, 2
  %cond164 = select i1 %cmp159, i32 %and55, i32 %and57
  %cmp165 = icmp eq i32 %add127, 2
  %cond170 = select i1 %cmp165, i32 %and56, i32 %cond164
  %cmp179 = icmp ugt i32 %and58, %and59
  %conv180 = zext i1 %cmp179 to i32
  %cmp181 = icmp ugt i32 %and58, %and60
  %conv182 = zext i1 %cmp181 to i32
  %cmp183 = icmp ugt i32 %and59, %and60
  %conv184 = zext i1 %cmp183 to i32
  %add185 = add nuw nsw i32 %conv182, %conv180
  %lnot.ext188 = xor i32 %conv180, 1
  %add189 = add nuw nsw i32 %conv184, %lnot.ext188
  %lnot.ext192 = xor i32 %conv182, 1
  %lnot.ext195 = xor i32 %conv184, 1
  %add196 = add nuw nsw i32 %lnot.ext192, %lnot.ext195
  %cmp197 = icmp eq i32 %add189, 0
  %cond202 = select i1 %cmp197, i32 %and59, i32 %and58
  %cmp203 = icmp eq i32 %add196, 0
  %cond208 = select i1 %cmp203, i32 %and60, i32 %cond202
  %cmp209 = icmp eq i32 %add185, 1
  %cond214 = select i1 %cmp209, i32 %and58, i32 %and59
  %cmp215 = icmp eq i32 %add196, 1
  %cond220 = select i1 %cmp215, i32 %and60, i32 %cond214
  %cmp221 = icmp eq i32 %add185, 2
  %cond226 = select i1 %cmp221, i32 %and58, i32 %and60
  %cmp227 = icmp eq i32 %add189, 2
  %cond232 = select i1 %cmp227, i32 %and59, i32 %cond226
  %cmp241 = icmp ule i32 %cond84, %cond146
  %cmp243 = icmp ule i32 %cond84, %cond208
  %cmp245 = icmp ugt i32 %cond146, %cond208
  %lnot.ext250 = zext i1 %cmp241 to i32
  %lnot.ext254 = zext i1 %cmp243 to i32
  %14 = zext i1 %cmp245 to i32
  %lnot.ext257 = xor i32 %14, 1
  %add251 = sext i1 %cmp245 to i32
  %cmp259 = icmp eq i32 %lnot.ext250, %add251
  %cond264 = select i1 %cmp259, i32 %cond146, i32 %cond84
  %add258 = sub nsw i32 0, %lnot.ext257
  %cmp265 = icmp eq i32 %lnot.ext254, %add258
  %cond270 = select i1 %cmp265, i32 %cond208, i32 %cond264
  %cmp303 = icmp ugt i32 %cond96, %cond158
  %conv304 = zext i1 %cmp303 to i32
  %cmp305 = icmp ugt i32 %cond96, %cond220
  %conv306 = zext i1 %cmp305 to i32
  %cmp307 = icmp ule i32 %cond158, %cond220
  %add309 = add nuw nsw i32 %conv306, %conv304
  %lnot.ext316 = xor i32 %conv306, 1
  %lnot.ext319 = zext i1 %cmp307 to i32
  %add320 = add nuw nsw i32 %lnot.ext316, %lnot.ext319
  %cmp333 = icmp eq i32 %add309, 1
  %cond338 = select i1 %cmp333, i32 %cond96, i32 %cond158
  %cmp339 = icmp eq i32 %add320, 1
  %cond344 = select i1 %cmp339, i32 %cond220, i32 %cond338
  %cmp365 = icmp ugt i32 %cond108, %cond170
  %conv366 = zext i1 %cmp365 to i32
  %cmp367 = icmp ugt i32 %cond108, %cond232
  %conv368 = zext i1 %cmp367 to i32
  %cmp369 = icmp ugt i32 %cond170, %cond232
  %conv370 = zext i1 %cmp369 to i32
  %add371 = add nuw nsw i32 %conv368, %conv366
  %lnot.ext374 = xor i32 %conv366, 1
  %add375 = add nuw nsw i32 %lnot.ext374, %conv370
  %cmp407 = icmp eq i32 %add371, 2
  %cond412 = select i1 %cmp407, i32 %cond108, i32 %cond232
  %cmp413 = icmp eq i32 %add375, 2
  %cond418 = select i1 %cmp413, i32 %cond170, i32 %cond412
  %cmp427 = icmp ugt i32 %cond270, %cond344
  %conv428 = zext i1 %cmp427 to i32
  %cmp429 = icmp ugt i32 %cond270, %cond418
  %conv430 = zext i1 %cmp429 to i32
  %cmp431 = icmp ule i32 %cond344, %cond418
  %add433 = add nuw nsw i32 %conv430, %conv428
  %lnot.ext440 = xor i32 %conv430, 1
  %lnot.ext443 = zext i1 %cmp431 to i32
  %add444 = add nuw nsw i32 %lnot.ext440, %lnot.ext443
  %cmp457 = icmp eq i32 %add433, 1
  %cond462 = select i1 %cmp457, i32 %cond270, i32 %cond344
  %cmp463 = icmp eq i32 %add444, 1
  %cond468 = select i1 %cmp463, i32 %cond418, i32 %cond462
  %shr = lshr i32 %5, 8
  %and481 = and i32 %shr, 255
  %shr482 = lshr i32 %8, 8
  %and483 = and i32 %shr482, 255
  %shr484 = lshr i32 %11, 8
  %and485 = and i32 %shr484, 255
  %shr486 = lshr i32 %6, 8
  %and487 = and i32 %shr486, 255
  %shr488 = lshr i32 %9, 8
  %and489 = and i32 %shr488, 255
  %shr490 = lshr i32 %12, 8
  %and491 = and i32 %shr490, 255
  %shr492 = lshr i32 %7, 8
  %and493 = and i32 %shr492, 255
  %shr494 = lshr i32 %10, 8
  %and495 = and i32 %shr494, 255
  %shr496 = lshr i32 %13, 8
  %and497 = and i32 %shr496, 255
  %cmp506 = icmp ugt i32 %and481, %and483
  %conv507 = zext i1 %cmp506 to i32
  %cmp508 = icmp ugt i32 %and481, %and485
  %conv509 = zext i1 %cmp508 to i32
  %cmp510 = icmp ugt i32 %and483, %and485
  %conv511 = zext i1 %cmp510 to i32
  %add512 = add nuw nsw i32 %conv509, %conv507
  %lnot.ext515 = xor i32 %conv507, 1
  %add516 = add nuw nsw i32 %conv511, %lnot.ext515
  %lnot.ext519 = xor i32 %conv509, 1
  %lnot.ext522 = xor i32 %conv511, 1
  %add523 = add nuw nsw i32 %lnot.ext519, %lnot.ext522
  %cmp524 = icmp eq i32 %add516, 0
  %cond529 = select i1 %cmp524, i32 %and483, i32 %and481
  %cmp530 = icmp eq i32 %add523, 0
  %cond535 = select i1 %cmp530, i32 %and485, i32 %cond529
  %cmp536 = icmp eq i32 %add512, 1
  %cond541 = select i1 %cmp536, i32 %and481, i32 %and483
  %cmp542 = icmp eq i32 %add523, 1
  %cond547 = select i1 %cmp542, i32 %and485, i32 %cond541
  %cmp548 = icmp eq i32 %add512, 2
  %cond553 = select i1 %cmp548, i32 %and481, i32 %and485
  %cmp554 = icmp eq i32 %add516, 2
  %cond559 = select i1 %cmp554, i32 %and483, i32 %cond553
  %cmp568 = icmp ugt i32 %and487, %and489
  %conv569 = zext i1 %cmp568 to i32
  %cmp570 = icmp ugt i32 %and487, %and491
  %conv571 = zext i1 %cmp570 to i32
  %cmp572 = icmp ugt i32 %and489, %and491
  %conv573 = zext i1 %cmp572 to i32
  %add574 = add nuw nsw i32 %conv571, %conv569
  %lnot.ext577 = xor i32 %conv569, 1
  %add578 = add nuw nsw i32 %conv573, %lnot.ext577
  %lnot.ext581 = xor i32 %conv571, 1
  %lnot.ext584 = xor i32 %conv573, 1
  %add585 = add nuw nsw i32 %lnot.ext581, %lnot.ext584
  %cmp586 = icmp eq i32 %add578, 0
  %cond591 = select i1 %cmp586, i32 %and489, i32 %and487
  %cmp592 = icmp eq i32 %add585, 0
  %cond597 = select i1 %cmp592, i32 %and491, i32 %cond591
  %cmp598 = icmp eq i32 %add574, 1
  %cond603 = select i1 %cmp598, i32 %and487, i32 %and489
  %cmp604 = icmp eq i32 %add585, 1
  %cond609 = select i1 %cmp604, i32 %and491, i32 %cond603
  %cmp610 = icmp eq i32 %add574, 2
  %cond615 = select i1 %cmp610, i32 %and487, i32 %and491
  %cmp616 = icmp eq i32 %add578, 2
  %cond621 = select i1 %cmp616, i32 %and489, i32 %cond615
  %cmp630 = icmp ugt i32 %and493, %and495
  %conv631 = zext i1 %cmp630 to i32
  %cmp632 = icmp ugt i32 %and493, %and497
  %conv633 = zext i1 %cmp632 to i32
  %cmp634 = icmp ugt i32 %and495, %and497
  %conv635 = zext i1 %cmp634 to i32
  %add636 = add nuw nsw i32 %conv633, %conv631
  %lnot.ext639 = xor i32 %conv631, 1
  %add640 = add nuw nsw i32 %conv635, %lnot.ext639
  %lnot.ext643 = xor i32 %conv633, 1
  %lnot.ext646 = xor i32 %conv635, 1
  %add647 = add nuw nsw i32 %lnot.ext643, %lnot.ext646
  %cmp648 = icmp eq i32 %add640, 0
  %cond653 = select i1 %cmp648, i32 %and495, i32 %and493
  %cmp654 = icmp eq i32 %add647, 0
  %cond659 = select i1 %cmp654, i32 %and497, i32 %cond653
  %cmp660 = icmp eq i32 %add636, 1
  %cond665 = select i1 %cmp660, i32 %and493, i32 %and495
  %cmp666 = icmp eq i32 %add647, 1
  %cond671 = select i1 %cmp666, i32 %and497, i32 %cond665
  %cmp672 = icmp eq i32 %add636, 2
  %cond677 = select i1 %cmp672, i32 %and493, i32 %and497
  %cmp678 = icmp eq i32 %add640, 2
  %cond683 = select i1 %cmp678, i32 %and495, i32 %cond677
  %cmp692 = icmp ule i32 %cond535, %cond597
  %cmp694 = icmp ule i32 %cond535, %cond659
  %cmp696 = icmp ugt i32 %cond597, %cond659
  %lnot.ext701 = zext i1 %cmp692 to i32
  %lnot.ext705 = zext i1 %cmp694 to i32
  %15 = zext i1 %cmp696 to i32
  %lnot.ext708 = xor i32 %15, 1
  %add702 = sext i1 %cmp696 to i32
  %cmp710 = icmp eq i32 %lnot.ext701, %add702
  %cond715 = select i1 %cmp710, i32 %cond597, i32 %cond535
  %add709 = sub nsw i32 0, %lnot.ext708
  %cmp716 = icmp eq i32 %lnot.ext705, %add709
  %cond721 = select i1 %cmp716, i32 %cond659, i32 %cond715
  %cmp754 = icmp ugt i32 %cond547, %cond609
  %conv755 = zext i1 %cmp754 to i32
  %cmp756 = icmp ugt i32 %cond547, %cond671
  %conv757 = zext i1 %cmp756 to i32
  %cmp758 = icmp ule i32 %cond609, %cond671
  %add760 = add nuw nsw i32 %conv757, %conv755
  %lnot.ext767 = xor i32 %conv757, 1
  %lnot.ext770 = zext i1 %cmp758 to i32
  %add771 = add nuw nsw i32 %lnot.ext767, %lnot.ext770
  %cmp784 = icmp eq i32 %add760, 1
  %cond789 = select i1 %cmp784, i32 %cond547, i32 %cond609
  %cmp790 = icmp eq i32 %add771, 1
  %cond795 = select i1 %cmp790, i32 %cond671, i32 %cond789
  %cmp816 = icmp ugt i32 %cond559, %cond621
  %conv817 = zext i1 %cmp816 to i32
  %cmp818 = icmp ugt i32 %cond559, %cond683
  %conv819 = zext i1 %cmp818 to i32
  %cmp820 = icmp ugt i32 %cond621, %cond683
  %conv821 = zext i1 %cmp820 to i32
  %add822 = add nuw nsw i32 %conv819, %conv817
  %lnot.ext825 = xor i32 %conv817, 1
  %add826 = add nuw nsw i32 %lnot.ext825, %conv821
  %cmp858 = icmp eq i32 %add822, 2
  %cond863 = select i1 %cmp858, i32 %cond559, i32 %cond683
  %cmp864 = icmp eq i32 %add826, 2
  %cond869 = select i1 %cmp864, i32 %cond621, i32 %cond863
  %cmp878 = icmp ugt i32 %cond721, %cond795
  %conv879 = zext i1 %cmp878 to i32
  %cmp880 = icmp ugt i32 %cond721, %cond869
  %conv881 = zext i1 %cmp880 to i32
  %cmp882 = icmp ule i32 %cond795, %cond869
  %add884 = add nuw nsw i32 %conv881, %conv879
  %lnot.ext891 = xor i32 %conv881, 1
  %lnot.ext894 = zext i1 %cmp882 to i32
  %add895 = add nuw nsw i32 %lnot.ext891, %lnot.ext894
  %cmp908 = icmp eq i32 %add884, 1
  %cond913 = select i1 %cmp908, i32 %cond721, i32 %cond795
  %cmp914 = icmp eq i32 %add895, 1
  %cond919 = select i1 %cmp914, i32 %cond869, i32 %cond913
  %shl = shl i32 %cond919, 8
  %or932 = or i32 %shl, %cond468
  %shr933 = lshr i32 %5, 16
  %and934 = and i32 %shr933, 255
  %shr935 = lshr i32 %8, 16
  %and936 = and i32 %shr935, 255
  %shr937 = lshr i32 %11, 16
  %and938 = and i32 %shr937, 255
  %shr939 = lshr i32 %6, 16
  %and940 = and i32 %shr939, 255
  %shr941 = lshr i32 %9, 16
  %and942 = and i32 %shr941, 255
  %shr943 = lshr i32 %12, 16
  %and944 = and i32 %shr943, 255
  %shr945 = lshr i32 %7, 16
  %and946 = and i32 %shr945, 255
  %shr947 = lshr i32 %10, 16
  %and948 = and i32 %shr947, 255
  %shr949 = lshr i32 %13, 16
  %and950 = and i32 %shr949, 255
  %cmp959 = icmp ugt i32 %and934, %and936
  %conv960 = zext i1 %cmp959 to i32
  %cmp961 = icmp ugt i32 %and934, %and938
  %conv962 = zext i1 %cmp961 to i32
  %cmp963 = icmp ugt i32 %and936, %and938
  %conv964 = zext i1 %cmp963 to i32
  %add965 = add nuw nsw i32 %conv962, %conv960
  %lnot.ext968 = xor i32 %conv960, 1
  %add969 = add nuw nsw i32 %conv964, %lnot.ext968
  %lnot.ext972 = xor i32 %conv962, 1
  %lnot.ext975 = xor i32 %conv964, 1
  %add976 = add nuw nsw i32 %lnot.ext972, %lnot.ext975
  %cmp977 = icmp eq i32 %add969, 0
  %cond982 = select i1 %cmp977, i32 %and936, i32 %and934
  %cmp983 = icmp eq i32 %add976, 0
  %cond988 = select i1 %cmp983, i32 %and938, i32 %cond982
  %cmp989 = icmp eq i32 %add965, 1
  %cond994 = select i1 %cmp989, i32 %and934, i32 %and936
  %cmp995 = icmp eq i32 %add976, 1
  %cond1000 = select i1 %cmp995, i32 %and938, i32 %cond994
  %cmp1001 = icmp eq i32 %add965, 2
  %cond1006 = select i1 %cmp1001, i32 %and934, i32 %and938
  %cmp1007 = icmp eq i32 %add969, 2
  %cond1012 = select i1 %cmp1007, i32 %and936, i32 %cond1006
  %cmp1021 = icmp ugt i32 %and940, %and942
  %conv1022 = zext i1 %cmp1021 to i32
  %cmp1023 = icmp ugt i32 %and940, %and944
  %conv1024 = zext i1 %cmp1023 to i32
  %cmp1025 = icmp ugt i32 %and942, %and944
  %conv1026 = zext i1 %cmp1025 to i32
  %add1027 = add nuw nsw i32 %conv1024, %conv1022
  %lnot.ext1030 = xor i32 %conv1022, 1
  %add1031 = add nuw nsw i32 %conv1026, %lnot.ext1030
  %lnot.ext1034 = xor i32 %conv1024, 1
  %lnot.ext1037 = xor i32 %conv1026, 1
  %add1038 = add nuw nsw i32 %lnot.ext1034, %lnot.ext1037
  %cmp1039 = icmp eq i32 %add1031, 0
  %cond1044 = select i1 %cmp1039, i32 %and942, i32 %and940
  %cmp1045 = icmp eq i32 %add1038, 0
  %cond1050 = select i1 %cmp1045, i32 %and944, i32 %cond1044
  %cmp1051 = icmp eq i32 %add1027, 1
  %cond1056 = select i1 %cmp1051, i32 %and940, i32 %and942
  %cmp1057 = icmp eq i32 %add1038, 1
  %cond1062 = select i1 %cmp1057, i32 %and944, i32 %cond1056
  %cmp1063 = icmp eq i32 %add1027, 2
  %cond1068 = select i1 %cmp1063, i32 %and940, i32 %and944
  %cmp1069 = icmp eq i32 %add1031, 2
  %cond1074 = select i1 %cmp1069, i32 %and942, i32 %cond1068
  %cmp1083 = icmp ugt i32 %and946, %and948
  %conv1084 = zext i1 %cmp1083 to i32
  %cmp1085 = icmp ugt i32 %and946, %and950
  %conv1086 = zext i1 %cmp1085 to i32
  %cmp1087 = icmp ugt i32 %and948, %and950
  %conv1088 = zext i1 %cmp1087 to i32
  %add1089 = add nuw nsw i32 %conv1086, %conv1084
  %lnot.ext1092 = xor i32 %conv1084, 1
  %add1093 = add nuw nsw i32 %conv1088, %lnot.ext1092
  %lnot.ext1096 = xor i32 %conv1086, 1
  %lnot.ext1099 = xor i32 %conv1088, 1
  %add1100 = add nuw nsw i32 %lnot.ext1096, %lnot.ext1099
  %cmp1101 = icmp eq i32 %add1093, 0
  %cond1106 = select i1 %cmp1101, i32 %and948, i32 %and946
  %cmp1107 = icmp eq i32 %add1100, 0
  %cond1112 = select i1 %cmp1107, i32 %and950, i32 %cond1106
  %cmp1113 = icmp eq i32 %add1089, 1
  %cond1118 = select i1 %cmp1113, i32 %and946, i32 %and948
  %cmp1119 = icmp eq i32 %add1100, 1
  %cond1124 = select i1 %cmp1119, i32 %and950, i32 %cond1118
  %cmp1125 = icmp eq i32 %add1089, 2
  %cond1130 = select i1 %cmp1125, i32 %and946, i32 %and950
  %cmp1131 = icmp eq i32 %add1093, 2
  %cond1136 = select i1 %cmp1131, i32 %and948, i32 %cond1130
  %cmp1145 = icmp ule i32 %cond988, %cond1050
  %cmp1147 = icmp ule i32 %cond988, %cond1112
  %cmp1149 = icmp ugt i32 %cond1050, %cond1112
  %lnot.ext1154 = zext i1 %cmp1145 to i32
  %lnot.ext1158 = zext i1 %cmp1147 to i32
  %16 = zext i1 %cmp1149 to i32
  %lnot.ext1161 = xor i32 %16, 1
  %add1155 = sext i1 %cmp1149 to i32
  %cmp1163 = icmp eq i32 %lnot.ext1154, %add1155
  %cond1168 = select i1 %cmp1163, i32 %cond1050, i32 %cond988
  %add1162 = sub nsw i32 0, %lnot.ext1161
  %cmp1169 = icmp eq i32 %lnot.ext1158, %add1162
  %cond1174 = select i1 %cmp1169, i32 %cond1112, i32 %cond1168
  %cmp1207 = icmp ugt i32 %cond1000, %cond1062
  %conv1208 = zext i1 %cmp1207 to i32
  %cmp1209 = icmp ugt i32 %cond1000, %cond1124
  %conv1210 = zext i1 %cmp1209 to i32
  %cmp1211 = icmp ule i32 %cond1062, %cond1124
  %add1213 = add nuw nsw i32 %conv1210, %conv1208
  %lnot.ext1220 = xor i32 %conv1210, 1
  %lnot.ext1223 = zext i1 %cmp1211 to i32
  %add1224 = add nuw nsw i32 %lnot.ext1220, %lnot.ext1223
  %cmp1237 = icmp eq i32 %add1213, 1
  %cond1242 = select i1 %cmp1237, i32 %cond1000, i32 %cond1062
  %cmp1243 = icmp eq i32 %add1224, 1
  %cond1248 = select i1 %cmp1243, i32 %cond1124, i32 %cond1242
  %cmp1269 = icmp ugt i32 %cond1012, %cond1074
  %conv1270 = zext i1 %cmp1269 to i32
  %cmp1271 = icmp ugt i32 %cond1012, %cond1136
  %conv1272 = zext i1 %cmp1271 to i32
  %cmp1273 = icmp ugt i32 %cond1074, %cond1136
  %conv1274 = zext i1 %cmp1273 to i32
  %add1275 = add nuw nsw i32 %conv1272, %conv1270
  %lnot.ext1278 = xor i32 %conv1270, 1
  %add1279 = add nuw nsw i32 %lnot.ext1278, %conv1274
  %cmp1311 = icmp eq i32 %add1275, 2
  %cond1316 = select i1 %cmp1311, i32 %cond1012, i32 %cond1136
  %cmp1317 = icmp eq i32 %add1279, 2
  %cond1322 = select i1 %cmp1317, i32 %cond1074, i32 %cond1316
  %cmp1331 = icmp ugt i32 %cond1174, %cond1248
  %conv1332 = zext i1 %cmp1331 to i32
  %cmp1333 = icmp ugt i32 %cond1174, %cond1322
  %conv1334 = zext i1 %cmp1333 to i32
  %cmp1335 = icmp ule i32 %cond1248, %cond1322
  %add1337 = add nuw nsw i32 %conv1334, %conv1332
  %lnot.ext1344 = xor i32 %conv1334, 1
  %lnot.ext1347 = zext i1 %cmp1335 to i32
  %add1348 = add nuw nsw i32 %lnot.ext1344, %lnot.ext1347
  %cmp1361 = icmp eq i32 %add1337, 1
  %cond1366 = select i1 %cmp1361, i32 %cond1174, i32 %cond1248
  %cmp1367 = icmp eq i32 %add1348, 1
  %cond1372 = select i1 %cmp1367, i32 %cond1322, i32 %cond1366
  %shl1385 = shl i32 %cond1372, 16
  %or1386 = or i32 %or932, %shl1385
  %arrayidx1389 = getelementptr inbounds i32, i32* %out, i32 %add20
  store i32 %or1386, i32* %arrayidx1389, align 4, !tbaa !10
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6}

!0 = !{void (i32*, i32*)* @median, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"uint*", !"uint*"}
!4 = !{!"kernel_arg_base_type", !"uint*", !"uint*"}
!5 = !{!"kernel_arg_type_qual", !"", !""}
!6 = !{!"clang version 3.7.0 (tags/RELEASE_371/final)"}
!7 = !{i32 15507}
!8 = !{i32 15647}
!9 = !{i32 15286}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}