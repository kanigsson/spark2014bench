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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const o_a (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const dummy1 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int integer)))))))
(declare-fun slide1 ((Array Int (Array Int integer)) Int
  Int) (Array Int (Array Int integer)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int integer))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int integer))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 2
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 2) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int integer)))
  (b (Array Int (Array Int integer))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 2
     (select b (+ (- b__first a__first) temp___idx_155)) 1 2) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const o_b (Array Int (Array Int integer)))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort ta_tD1 0)

(declare-fun ta_tD1qtint (ta_tD1) Int)

;; ta_tD1'axiom
  (assert
  (forall ((i ta_tD1)) (and (<= 1 (ta_tD1qtint i)) (<= (ta_tD1qtint i) 2))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (ta_tD1 ta_tD1) Bool)

(declare-const dummy2 ta_tD1)

(declare-datatypes ((ta_tD1__ref 0))
(((ta_tD1__refqtmk (ta_tD1__content ta_tD1)))))
(define-fun ta_tD1__ref_ta_tD1__content__projection ((a ta_tD1__ref)) ta_tD1 
  (ta_tD1__content a))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((ta_tB__ref 0))
(((ta_tB__refqtmk (ta_tB__content us_t)))))
(define-fun ta_tB__ref_ta_tB__content__projection ((a ta_tB__ref)) us_t 
  (ta_tB__content a))

(declare-sort tb_tD1 0)

(declare-fun tb_tD1qtint (tb_tD1) Int)

;; tb_tD1'axiom
  (assert
  (forall ((i tb_tD1)) (and (<= 1 (tb_tD1qtint i)) (<= (tb_tD1qtint i) 2))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (tb_tD1 tb_tD1) Bool)

(declare-const dummy4 tb_tD1)

(declare-datatypes ((tb_tD1__ref 0))
(((tb_tD1__refqtmk (tb_tD1__content tb_tD1)))))
(define-fun tb_tD1__ref_tb_tD1__content__projection ((a tb_tD1__ref)) tb_tD1 
  (tb_tD1__content a))

(declare-fun temp_____aggregate_def_200 ((Array Int integer) Int
  Int) (Array Int integer))

(declare-fun update_proof__B_1__a__aggregate_def (Int
  Int) (Array Int integer))

(declare-fun temp_____aggregate_def_216 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_228 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_240 ((Array Int (Array Int integer)) Int
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_246 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_256 (Int) (Array Int integer))

(declare-fun update_proof__B_2__b__aggregate_def ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_276 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_281 (Int Int) (Array Int integer))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

;; def_axiom
  (assert
  (forall ((temp___213 Int) (temp___214 Int))
  (let ((temp___212 (update_proof__B_1__a__aggregate_def temp___213
                    temp___214)))
  (=>
  (and (dynamic_invariant temp___213 true true true true) (dynamic_invariant
  temp___214 true true true true))
  (and (= (select temp___212 1) rliteral)
  (= (select temp___212 2) rliteral1))))))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 0))

;; def_axiom
  (assert
  (forall ((temp___202 (Array Int integer)))
  (forall ((temp___203 Int) (temp___204 Int))
  (let ((temp___201 (temp_____aggregate_def_200 temp___202 temp___203
                    temp___204)))
  (=>
  (and (in_range2 temp___203) (dynamic_invariant temp___204 true true true
  true))
  (forall ((temp___205 Int))
  (ite (= temp___205 temp___203) (= (select temp___201 temp___205) rliteral2)
  (= (select temp___201 temp___205) (select temp___202 temp___205)))))))))

;; def_axiom
  (assert
  (forall ((temp___273 (Array Int integer)) (temp___274 (Array Int integer)))
  (let ((temp___272 (update_proof__B_2__b__aggregate_def temp___273
                    temp___274)))
  (and (= (select temp___272 1) temp___273)
  (= (select temp___272 2) temp___274)))))

(declare-const rliteral3 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral3) 11))

(declare-const rliteral4 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral4) 12))

;; def_axiom
  (assert
  (forall ((temp___278 Int) (temp___279 Int))
  (let ((temp___277 (temp_____aggregate_def_276 temp___278 temp___279)))
  (=>
  (and (dynamic_invariant temp___278 true true true true) (dynamic_invariant
  temp___279 true true true true))
  (and (= (select temp___277 1) rliteral3)
  (= (select temp___277 2) rliteral4))))))

(declare-const rliteral5 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral5) 21))

(declare-const rliteral6 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral6) 22))

;; def_axiom
  (assert
  (forall ((temp___283 Int) (temp___284 Int))
  (let ((temp___282 (temp_____aggregate_def_281 temp___283 temp___284)))
  (=>
  (and (dynamic_invariant temp___283 true true true true) (dynamic_invariant
  temp___284 true true true true))
  (and (= (select temp___282 1) rliteral5)
  (= (select temp___282 2) rliteral6))))))

;; def_axiom
  (assert
  (forall ((temp___218 Int))
  (=> (dynamic_invariant temp___218 true true true true)
  (forall ((temp___219 Int))
  (= (select (temp_____aggregate_def_216 temp___218) temp___219) rliteral2)))))

;; def_axiom
  (assert
  (forall ((temp___230 Int))
  (=> (dynamic_invariant temp___230 true true true true)
  (forall ((temp___231 Int))
  (= (select (temp_____aggregate_def_228 temp___230) temp___231) rliteral2)))))

;; def_axiom
  (assert
  (forall ((temp___242 (Array Int (Array Int integer))))
  (forall ((temp___243 Int))
  (forall ((temp___244 (Array Int integer)))
  (let ((temp___241 (temp_____aggregate_def_240 temp___242 temp___243
                    temp___244)))
  (=> (in_range3 temp___243)
  (forall ((temp___245 Int))
  (ite (= temp___245 temp___243)
  (= (select temp___241 temp___245) temp___244)
  (= (select temp___241 temp___245) (select temp___242 temp___245))))))))))

;; def_axiom
  (assert
  (forall ((temp___248 Int))
  (=> (dynamic_invariant temp___248 true true true true)
  (forall ((temp___249 Int))
  (= (select (temp_____aggregate_def_246 temp___248) temp___249) rliteral2)))))

;; def_axiom
  (assert
  (forall ((temp___258 Int))
  (=> (dynamic_invariant temp___258 true true true true)
  (forall ((temp___259 Int))
  (= (select (temp_____aggregate_def_256 temp___258) temp___259) rliteral2)))))

(assert
;; defqtvc
 ;; File "update_proof.adb", line 1, characters 0-0
  (not
  (forall ((a (Array Int integer)) (a1 (Array Int integer))
  (b (Array Int (Array Int integer))) (b1 (Array Int (Array Int integer))))
  (=> (= a (update_proof__B_1__a__aggregate_def 1 2))
  (=> (= a o_a)
  (=> (= a1 (store a 2 rliteral2))
  (=> (= (to_rep (select a1 1)) (to_rep (select o_a 1)))
  (=> (= (to_rep (select a1 2)) 0)
  (=> (= (bool_eq a1 1 2 (temp_____aggregate_def_200 o_a 2 0) 1 2) true)
  (=>
  (= b (update_proof__B_2__b__aggregate_def
       (temp_____aggregate_def_276 11 12) (temp_____aggregate_def_281 21 22)))
  (=> (= b o_b)
  (=> (= b1 (store b 2 (temp_____aggregate_def_216 0)))
  (=> (= (bool_eq (select b1 1) 1 2 (select o_b 1) 1 2) true)
  (=> (= (bool_eq (select b1 2) 1 2 (temp_____aggregate_def_228 0) 1 2) true)
  (= (bool_eq1 b1 1 2
     (temp_____aggregate_def_240 o_b 2 (temp_____aggregate_def_246 0)) 1 2) true)))))))))))))))
(check-sat)
(exit)
