(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv x ((_ int2bv 64) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 64))))))
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

(declare-fun inrange64 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun inrange64__function_guard (Bool (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(declare-sort unsigned64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 64))

(declare-fun user_eq (unsigned64 unsigned64) Bool)

(declare-const dummy unsigned64)

(declare-datatypes ((unsigned64__ref 0))
(((unsigned64__refqtmk (unsigned64__content unsigned64)))))
(define-fun unsigned64__ref_unsigned64__content__projection ((a unsigned64__ref)) unsigned64 
  (unsigned64__content a))

(define-fun dynamic_invariant ((temp___expr_169 (_ BitVec 64))
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool) (temp___do_typ_inv_168 Bool)) Bool true)

;; inrange64__post_axiom
  (assert
  (forall ((var (_ BitVec 64)) (bottom (_ BitVec 64))
  (range_size (_ BitVec 64)))
  (! (=>
     (and
     (and (dynamic_invariant var true true true true) (dynamic_invariant
     bottom true true true true)) (dynamic_invariant range_size true true
     true true))
     (let ((result (inrange64 var bottom range_size)))
     (=> (inrange64__function_guard result var bottom range_size)
     (= (= result true)
     (exists ((n (_ BitVec 64)))
     (and (and (bvule #x0000000000000000 n) (bvule n range_size))
     (= var (bvadd bottom n)))))))) :pattern ((inrange64 var bottom
                                              range_size)) )))

(declare-const var1 (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const var1_range_size (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const var2 (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const var2_range_size (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const res Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-sort unsigned_64 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (unsigned_64 unsigned_64) Bool)

(declare-const dummy1 unsigned_64)

(declare-datatypes ((unsigned_64__ref 0))
(((unsigned_64__refqtmk (unsigned_64__content unsigned_64)))))
(define-fun unsigned_64__ref_unsigned_64__content__projection ((a unsigned_64__ref)) unsigned_64 
  (unsigned_64__content a))

(declare-fun to_rep (unsigned_64) (_ BitVec 64))

(declare-fun of_rep ((_ BitVec 64)) unsigned_64)

;; inversion_axiom
  (assert
  (forall ((x unsigned_64))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int2 ((x unsigned_64)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned_64)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-const attr__ATTRIBUTE_MODULUS2 (_ BitVec 64))

(define-fun dynamic_property ((first_int (_ BitVec 64))
  (last_int (_ BitVec 64))
  (x (_ BitVec 64))) Bool (and (bvule first_int x) (bvule x last_int)))

(define-fun dynamic_property_int ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (unsigned_64 unsigned_64) Bool)

(declare-const dummy2 unsigned_64)

(declare-datatypes ((t101b__ref 0))
(((t101b__refqtmk (t101b__content unsigned_64)))))
(define-fun t101b__ref_t101b__content__projection ((a t101b__ref)) unsigned_64 
  (t101b__content a))

(declare-const attr__ATTRIBUTE_MODULUS3 (_ BitVec 64))

(define-fun dynamic_property1 ((first_int (_ BitVec 64))
  (last_int (_ BitVec 64))
  (x (_ BitVec 64))) Bool (and (bvule first_int x) (bvule x last_int)))

(define-fun dynamic_property_int1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 64))

(declare-fun user_eq3 (unsigned_64 unsigned_64) Bool)

(declare-const dummy3 unsigned_64)

(declare-datatypes ((t122b__ref 0))
(((t122b__refqtmk (t122b__content unsigned_64)))))
(define-fun t122b__ref_t122b__content__projection ((a t122b__ref)) unsigned_64 
  (t122b__content a))

(declare-const attr__ATTRIBUTE_MODULUS4 (_ BitVec 64))

(define-fun dynamic_property2 ((first_int (_ BitVec 64))
  (last_int (_ BitVec 64))
  (x (_ BitVec 64))) Bool (and (bvule first_int x) (bvule x last_int)))

(define-fun dynamic_property_int2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 64))

(declare-fun user_eq4 (unsigned_64 unsigned_64) Bool)

(declare-const dummy4 unsigned_64)

(declare-datatypes ((t131b__ref 0))
(((t131b__refqtmk (t131b__content unsigned_64)))))
(define-fun t131b__ref_t131b__content__projection ((a t131b__ref)) unsigned_64 
  (t131b__content a))

(define-fun dynamic_invariant1 ((temp___expr_162 (_ BitVec 64))
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool) (temp___do_typ_inv_161 Bool)) Bool true)

;; res__def_axiom
  (assert
  (and (inrange64__function_guard
  (inrange64 var1 (bvsub var2 var1_range_size)
  (bvadd var1_range_size var2_range_size)) var1 (bvsub var2 var1_range_size)
  (bvadd var1_range_size var2_range_size))
  (= res (inrange64 var1 (bvsub var2 var1_range_size)
         (bvadd var1_range_size var2_range_size)))))

(assert
;; defqtvc
 ;; File "x86.ads", line 19, characters 0-0
  (not
  (forall ((n1 (_ BitVec 64)) (n2 (_ BitVec 64)))
  (=> (dynamic_invariant var1 true false true true)
  (=> (dynamic_invariant var1_range_size true false true true)
  (=> (dynamic_invariant var2 true false true true)
  (=> (dynamic_invariant var2_range_size true false true true)
  (=> (bvule var1_range_size (bvsub #xFFFFFFFFFFFFFFFF var2_range_size))
  (let ((o (bvadd var1_range_size var2_range_size)))
  (let ((o1 (bvsub var2 var1_range_size)))
  (let ((o2 var1))
  (let ((x86__rangesintersect__B100b__res__assume (inrange64 o2 o1 o)))
  (=>
  (and (inrange64__function_guard x86__rangesintersect__B100b__res__assume o2
  o1 o)
  (= (= x86__rangesintersect__B100b__res__assume true)
  (exists ((n (_ BitVec 64)))
  (and (and (bvule #x0000000000000000 n) (bvule n o)) (= o2 (bvadd o1 n))))))
  (=> (= x86__rangesintersect__B100b__res__assume res)
  (forall ((spark__branch Bool))
  (=> (= spark__branch res)
  (=> (= spark__branch true)
  (forall ((n (_ BitVec 64)))
  (=> (= n #x0000000000000000)
  (=>
  (= (and (ite (bvule #x0000000000000000 n) true false) (ite (bvule n (bvadd 
                                                        var1_range_size 
                                                        var2_range_size))
                                                        true false)) true)
  (forall ((spark__branch1 Bool) (n11 (_ BitVec 64)) (n21 (_ BitVec 64)))
  (=>
  (exists ((spark__branch2 Bool))
  (and
  (= spark__branch2 (ite (= var1 (bvadd (bvsub var2 var1_range_size) n)) true
                    false))
  (ite (= spark__branch2 true)
  (and (dynamic_invariant n1 false false true true)
  (and (dynamic_invariant n2 false false true true)
  (and
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (bvugt n var1_range_size) true false))
  (ite (= spark__branch3 true)
  (and
  (and (= n11 #x0000000000000000)
  (and (= n21 (bvsub n var1_range_size)) (bvule n21 var2_range_size)))
  (= spark__branch1 spark__branch3))
  (and (= spark__branch1 (ite (bvult n var2_range_size) true false))
  (ite (= spark__branch1 true) (and (= n11 var1_range_size) (= n21 n))
  (and (= n11 (bvsub var1_range_size n)) (= n21 #x0000000000000000)))))))
  (and
  (and
  (and (and (bvule #x0000000000000000 n11) (bvule n11 var1_range_size))
  (and (bvule #x0000000000000000 n21) (bvule n21 var2_range_size)))
  (= (bvadd var1 n11) (bvadd var2 n21)))
  (exists ((i (_ BitVec 64)))
  (and (and (bvule #x0000000000000000 i) (bvule i var1_range_size))
  (exists ((j (_ BitVec 64)))
  (and (and (bvule #x0000000000000000 j) (bvule j var2_range_size))
  (= (bvadd var1 i) (bvadd var2 j))))))))))
  (and (and (= spark__branch1 spark__branch2) (= n11 n1)) (= n21 n2)))))
  (or
  (forall ((m (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 m) (bvule m n))
  (not (= var1 (bvadd (bvsub var2 var1_range_size) m)))))
  (exists ((i (_ BitVec 64)))
  (and (and (bvule #x0000000000000000 i) (bvule i var1_range_size))
  (exists ((j (_ BitVec 64)))
  (and (and (bvule #x0000000000000000 j) (bvule j var2_range_size))
  (= (bvadd var1 i) (bvadd var2 j)))))))))))))))))))))))))))))
(check-sat)
(exit)
