(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-sort sqrt_domain 0)

(declare-fun sqrt_domainqtint (sqrt_domain) Int)

;; sqrt_domain'axiom
  (assert
  (forall ((i sqrt_domain))
  (and (<= 0 (sqrt_domainqtint i)) (<= (sqrt_domainqtint i) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (sqrt_domain sqrt_domain) Bool)

(declare-const dummy1 sqrt_domain)

(declare-datatypes ()
((sqrt_domain__ref (sqrt_domain__refqtmk (sqrt_domain__content sqrt_domain)))))
(define-fun sqrt_domain__ref_sqrt_domain__content__projection ((a sqrt_domain__ref)) sqrt_domain 
  (sqrt_domain__content a))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_160)))

(declare-sort sqrt_range 0)

(declare-fun sqrt_rangeqtint (sqrt_range) Int)

;; sqrt_range'axiom
  (assert
  (forall ((i sqrt_range))
  (and (<= 0 (sqrt_rangeqtint i)) (<= (sqrt_rangeqtint i) 46340))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 46340)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (sqrt_range sqrt_range) Bool)

(declare-const dummy2 sqrt_range)

(declare-datatypes ()
((sqrt_range__ref (sqrt_range__refqtmk (sqrt_range__content sqrt_range)))))
(define-fun sqrt_range__ref_sqrt_range__content__projection ((a sqrt_range__ref)) sqrt_range 
  (sqrt_range__content a))

(declare-sort u64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 64))

(declare-fun user_eq3 (u64 u64) Bool)

(declare-const dummy3 u64)

(declare-datatypes () ((u64__ref (u64__refqtmk (u64__content u64)))))
(define-fun u64__ref_u64__content__projection ((a u64__ref)) u64 (u64__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_188 (_ BitVec 64))
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool) (temp___do_typ_inv_187 Bool)) Bool true)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 46340)) (in_range3
                                     temp___expr_167)))

(declare-const ux (_ BitVec 64))

(declare-const m (_ BitVec 64))

(declare-const y (_ BitVec 64))

(declare-const b (_ BitVec 64))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 ux false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 m false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 y false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 b false false true true))

(declare-const i (_ BitVec 64))

;; H
  (assert (= i #x0000000000000000))

;; Assume
  (assert (dynamic_invariant1 i true false true true))

(declare-const ux1 (_ BitVec 64))

;; H
  (assert (= ux1 ((_ int2bv 64) x)))

;; Assert
  (assert (bvule ux1 #x000000007FFFFFFF))

(declare-const m1 (_ BitVec 64))

;; H
  (assert (= m1 #x0000000040000000))

(declare-const y1 (_ BitVec 64))

;; H
  (assert (= y1 #x0000000000000000))

;; H
  (assert (not (= m1 #x0000000000000000)))

(declare-const i1 (_ BitVec 64))

;; H
  (assert (= i1 (bvadd i #x0000000000000001)))

(declare-const b1 (_ BitVec 64))

;; H
  (assert (= b1 (bvor y1 m1)))

(declare-const y2 (_ BitVec 64))

;; H
  (assert (= y2 (bvudiv y1 #x0000000000000002)))

(declare-const spark__branch Bool)

(declare-const ux2 (_ BitVec 64))

(declare-const y3 (_ BitVec 64))

;; H
  (assert (= spark__branch (ite (bvuge ux1 b1) true false)))

;; H
  (assert
  (ite (= spark__branch true)
  (and (= ux2 (bvsub ux1 b1)) (= y3 (bvor y2 m1)))
  (and (= ux2 ux1) (= y3 y2))))

(define-fun o () (_ BitVec 64) (bvsub #x0000000000000020 (bvmul #x0000000000000002 
  i1)))

;; Ensures
  (assert true)

(declare-const bits (_ BitVec 64))

;; H
  (assert (= bits o))

;; Assume
  (assert (dynamic_invariant1 bits true false true true))

(define-fun o1 () Int (bv2int bits))

;; Ensures
  (assert (in_range1 o1))

(define-fun o2 () (_ BitVec 64) (bvlshr ((_ int2bv 64) x) ((_ int2bv 64) 
  o1)))

;; Ensures
  (assert true)

(declare-const left_x (_ BitVec 64))

;; H
  (assert (= left_x o2))

;; Assume
  (assert (dynamic_invariant1 left_x true false true true))

(define-fun o3 () Int (bv2int bits))

;; Ensures
  (assert (in_range1 o3))

(define-fun o4 () (_ BitVec 64) (bvlshr y3 ((_ int2bv 64) o3)))

;; Ensures
  (assert true)

(declare-const left_y (_ BitVec 64))

;; H
  (assert (= left_y o4))

;; Assume
  (assert (dynamic_invariant1 left_y true false true true))

(define-fun o5 () Int (bv2int bits))

;; Ensures
  (assert (in_range1 o5))

(define-fun o6 () (_ BitVec 64) (bvlshr ux2 ((_ int2bv 64) o5)))

;; Ensures
  (assert true)

(declare-const left_ux (_ BitVec 64))

;; H
  (assert (= left_ux o6))

;; Assume
  (assert (dynamic_invariant1 left_ux true false true true))

(declare-const ux3 (_ BitVec 64))

(declare-const m2 (_ BitVec 64))

(declare-const y4 (_ BitVec 64))

(declare-const b2 (_ BitVec 64))

(declare-const i2 (_ BitVec 64))

(declare-const bits1 (_ BitVec 64))

(declare-const left_x1 (_ BitVec 64))

(declare-const left_y1 (_ BitVec 64))

(declare-const left_ux1 (_ BitVec 64))

;; LoopInvariant
  (assert (and (bvule #x0000000000000001 i2) (bvule i2 #x0000000000000010)))

;; LoopInvariant
  (assert
  (= m2 (let ((temp___214 (bv2int (bvsub #x0000000000000020 (bvmul #x0000000000000002 
        i2)))))
        (ite (< temp___214 18446744073709551616)
        (bvshl #x0000000000000001 ((_ int2bv 64) temp___214))
        #x0000000000000000))))

;; LoopInvariant
  (assert (= (bvurem y4 m2) #x0000000000000000))

;; LoopInvariant
  (assert
  (bvult left_y1 (let ((temp___210 (bv2int i2)))
                 (ite (< temp___210 18446744073709551616)
                 (bvshl #x0000000000000001 ((_ int2bv 64) temp___210))
                 #x0000000000000000))))

;; LoopInvariant
  (assert (= (bvurem ux3 m2) (bvurem ((_ int2bv 64) x) m2)))

;; LoopInvariant
  (assert (= left_ux1 (bvsub left_x1 (bvmul left_y1 left_y1))))

;; LoopInvariant
  (assert (bvule (bvmul left_y1 left_y1) left_x1))

;; LoopInvariant
  (assert
  (bvugt (bvmul (bvadd left_y1 #x0000000000000001) (bvadd left_y1 #x0000000000000001)) 
  left_x1))

;; Assume
  (assert
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and (dynamic_invariant1 left_y1 true true true true) (dynamic_invariant1
  ux3 false true true true)) (dynamic_invariant1 m2 false true true true))
  (dynamic_invariant1 bits1 true true true true)) (dynamic_invariant1
  left_ux1 true true true true)) (dynamic_invariant1 y4 false true true
  true)) (dynamic_invariant1 b2 false true true true)) (dynamic_invariant1
  left_x1 true true true true)) (dynamic_invariant1 i2 true true true true)))

(declare-const m3 (_ BitVec 64))

;; H
  (assert (= m3 (bvudiv m2 #x0000000000000004)))

;; H
  (assert (not (= m3 #x0000000000000000)))

(declare-const i3 (_ BitVec 64))

;; H
  (assert (= i3 (bvadd i2 #x0000000000000001)))

(declare-const b3 (_ BitVec 64))

;; H
  (assert (= b3 (bvor y4 m3)))

(declare-const y5 (_ BitVec 64))

;; H
  (assert (= y5 (bvudiv y4 #x0000000000000002)))

(declare-const ux4 (_ BitVec 64))

(declare-const y6 (_ BitVec 64))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (bvuge ux3 b3) true false)))

;; H
  (assert
  (ite (= spark__branch1 true)
  (and (= ux4 (bvsub ux3 b3)) (= y6 (bvor y5 m3)))
  (and (= ux4 ux3) (= y6 y5))))

(define-fun o7 () (_ BitVec 64) (bvsub #x0000000000000020 (bvmul #x0000000000000002 
  i3)))

;; Ensures
  (assert true)

(declare-const bits2 (_ BitVec 64))

;; H
  (assert (= bits2 o7))

;; Assume
  (assert (dynamic_invariant1 bits2 true false true true))

(define-fun o8 () Int (bv2int bits2))

;; Ensures
  (assert (in_range1 o8))

(define-fun o9 () (_ BitVec 64) (bvlshr ((_ int2bv 64) x) ((_ int2bv 64) 
  o8)))

;; Ensures
  (assert true)

(declare-const left_x2 (_ BitVec 64))

;; H
  (assert (= left_x2 o9))

;; Assume
  (assert (dynamic_invariant1 left_x2 true false true true))

(define-fun o10 () Int (bv2int bits2))

;; Ensures
  (assert (in_range1 o10))

(define-fun o11 () (_ BitVec 64) (bvlshr y6 ((_ int2bv 64) o10)))

;; Ensures
  (assert true)

(declare-const left_y2 (_ BitVec 64))

;; H
  (assert (= left_y2 o11))

;; Assume
  (assert (dynamic_invariant1 left_y2 true false true true))

(define-fun o12 () Int (bv2int bits2))

;; Ensures
  (assert (in_range1 o12))

(define-fun o13 () (_ BitVec 64) (bvlshr ux4 ((_ int2bv 64) o12)))

;; Ensures
  (assert true)

(declare-const left_ux2 (_ BitVec 64))

;; H
  (assert (= left_ux2 o13))

;; Assume
  (assert (dynamic_invariant1 left_ux2 true false true true))

;; LoopInvariant
  (assert (and (bvule #x0000000000000001 i3) (bvule i3 #x0000000000000010)))

;; LoopInvariant
  (assert
  (= m3 (let ((temp___214 (bv2int (bvsub #x0000000000000020 (bvmul #x0000000000000002 
        i3)))))
        (ite (< temp___214 18446744073709551616)
        (bvshl #x0000000000000001 ((_ int2bv 64) temp___214))
        #x0000000000000000))))

;; LoopInvariant
  (assert (= (bvurem y6 m3) #x0000000000000000))

;; LoopInvariant
  (assert
  (bvult left_y2 (let ((temp___210 (bv2int i3)))
                 (ite (< temp___210 18446744073709551616)
                 (bvshl #x0000000000000001 ((_ int2bv 64) temp___210))
                 #x0000000000000000))))

;; LoopInvariant
  (assert (= (bvurem ux4 m3) (bvurem ((_ int2bv 64) x) m3)))

;; LoopInvariant
  (assert (= left_ux2 (bvsub left_x2 (bvmul left_y2 left_y2))))

;; LoopInvariant
  (assert (bvule (bvmul left_y2 left_y2) left_x2))

(assert
;; defqtvc
 ;; File "p.ads", line 13, characters 0-0
  (not
  (bvugt (bvmul (bvadd left_y2 #x0000000000000001) (bvadd left_y2 #x0000000000000001)) 
  left_x2)))
(check-sat)
