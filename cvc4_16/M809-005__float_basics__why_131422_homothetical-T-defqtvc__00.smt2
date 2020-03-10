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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(declare-fun to_rep (float__) Float32)

(declare-fun of_rep (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int float__))))))
(declare-fun slide ((Array Int float__) Int Int) (Array Int float__))

;; slide_eq
  (assert
  (forall ((a (Array Int float__)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int float__)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int float__)) (a__first Int) (a__last Int)
  (b (Array Int float__)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (fp.eq (to_rep (select a temp___idx_154)) 
                           (to_rep
                           (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int float__)) (b (Array Int float__)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (fp.eq (to_rep (select a temp___idx_154)) (to_rep
                                            (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const d (Array Int float__))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const kv (Array Int float__))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const ka (Array Int float__))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun adjust2triangle (Float32 Float32 Float32) Float32)

(declare-fun adjust2triangle__function_guard (Float32 Float32 Float32
  Float32) Bool)

;; adjust2triangle__post_axiom
  (assert
  (forall ((d1 Float32) (kv1 Float32) (ka1 Float32))
  (! (=>
     (and
     (and
     (and (dynamic_invariant d1 true true true true) (dynamic_invariant kv1
     true true true true)) (dynamic_invariant ka1 true true true true))
     (and
     (and (not (fp.eq d1 (fp #b0 #b00000000 #b00000000000000000000000)))
     (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) kv1))
     (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) ka1)))
     (let ((result (adjust2triangle d1 kv1 ka1)))
     (=> (adjust2triangle__function_guard result d1 kv1 ka1)
     (and
     (and (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) result)
     (fp.leq result kv1)) (dynamic_invariant result true false true true))))) :pattern (
  (adjust2triangle d1 kv1 ka1)) )))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-sort joint_index 0)

(declare-fun joint_indexqtint (joint_index) Int)

;; joint_index'axiom
  (assert
  (forall ((i joint_index))
  (and (<= 1 (joint_indexqtint i)) (<= (joint_indexqtint i) 2))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (joint_index joint_index) Bool)

(declare-const dummy1 joint_index)

(declare-datatypes ((joint_index__ref 0))
(((joint_index__refqtmk (joint_index__content joint_index)))))
(define-fun joint_index__ref_joint_index__content__projection ((a joint_index__ref)) joint_index 
  (joint_index__content a))

(declare-sort t11b 0)

(declare-fun t11bqtint (t11b) Int)

;; t11b'axiom
  (assert
  (forall ((i t11b)) (and (<= 1 (t11bqtint i)) (<= (t11bqtint i) 2))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t11b t11b) Bool)

(declare-const dummy2 t11b)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content t11b)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) t11b 
  (t11b__content a))

(declare-fun homothetical__homothetical__lambda__aggregate_def (Float32) (Array Int float__))

(declare-fun homothetical__homothetical__upsilon__aggregate_def (Float32) (Array Int float__))

(declare-fun homothetical__homothetical__kvp__aggregate_def (Float32) (Array Int float__))

(declare-fun temp_____aggregate_def_201 (Float32) (Array Int float__))

(declare-fun temp_____aggregate_def_205 (Float32) (Array Int float__))

;; def_axiom
  (assert
  (forall ((temp___187 Float32))
  (=> (dynamic_invariant temp___187 true true true true)
  (forall ((temp___188 Int))
  (= (to_rep
     (select (homothetical__homothetical__lambda__aggregate_def temp___187) temp___188)) temp___187)))))

;; def_axiom
  (assert
  (forall ((temp___190 Float32))
  (=> (dynamic_invariant temp___190 true true true true)
  (forall ((temp___191 Int))
  (= (to_rep
     (select (homothetical__homothetical__upsilon__aggregate_def temp___190) temp___191)) temp___190)))))

;; def_axiom
  (assert
  (forall ((temp___193 Float32))
  (=> (dynamic_invariant temp___193 true true true true)
  (forall ((temp___194 Int))
  (= (to_rep
     (select (homothetical__homothetical__kvp__aggregate_def temp___193) temp___194)) temp___193)))))

;; def_axiom
  (assert
  (forall ((temp___203 Float32))
  (=> (dynamic_invariant temp___203 true true true true)
  (forall ((temp___204 Int))
  (= (to_rep (select (temp_____aggregate_def_201 temp___203) temp___204)) temp___203)))))

;; def_axiom
  (assert
  (forall ((temp___207 Float32))
  (=> (dynamic_invariant temp___207 true true true true)
  (forall ((temp___208 Int))
  (= (to_rep (select (temp_____aggregate_def_205 temp___207) temp___208)) temp___207)))))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 2)) (in_range1 temp___expr_161)))

(assert
;; defqtvc
 ;; File "homothetical.ads", line 12, characters 0-0
  (not
  (forall ((lambda1 (Array Int float__)) (upsilon (Array Int float__))
  (kvp (Array Int float__)) (i Int) (j Int))
  (=>
  (forall ((j1 Int))
  (=> (and (<= 1 j1) (<= j1 2))
  (and
  (and
  (not (fp.eq (to_rep (select d j1)) (fp #b0 #b00000000 #b00000000000000000000000)))
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) (to_rep
                                                       (select kv j1))))
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) (to_rep
                                                       (select ka j1))))))
  (=>
  (= lambda1 (homothetical__homothetical__lambda__aggregate_def
             (fp #b0 #b01111111 #b00000000000000000000000)))
  (=>
  (= upsilon (homothetical__homothetical__upsilon__aggregate_def
             (fp #b0 #b01111111 #b00000000000000000000000)))
  (=>
  (= kvp (homothetical__homothetical__kvp__aggregate_def
         (fp #b0 #b00000000 #b00000000000000000000000)))
  (=> (= i 1)
  (=> (= (and (ite (<= 1 i) true false) (ite (<= i 2) true false)) true)
  (=> (<= 1 j)
  (=> (<= j (- i 1))
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) (to_rep
                                                       (select kvp j))))))))))))))
(check-sat)
(exit)
