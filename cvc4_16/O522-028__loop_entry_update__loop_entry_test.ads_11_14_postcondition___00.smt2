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

(declare-sort component_t 0)

(declare-fun component_tqtint (component_t) Int)

;; component_t'axiom
  (assert
  (forall ((i component_t))
  (and (<= 0 (component_tqtint i)) (<= (component_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (component_t component_t) Bool)

(declare-const dummy component_t)

(declare-datatypes ((component_t__ref 0))
(((component_t__refqtmk (component_t__content component_t)))))
(define-fun component_t__ref_component_t__content__projection ((a component_t__ref)) component_t 
  (component_t__content a))

(define-fun to_rep ((x component_t)) Int (component_tqtint x))

(declare-fun of_rep (Int) component_t)

;; inversion_axiom
  (assert
  (forall ((x component_t))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x component_t)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int component_t))))))
(declare-fun slide ((Array Int component_t) Int Int) (Array Int component_t))

;; slide_eq
  (assert
  (forall ((a (Array Int component_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int component_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int component_t)) (a__first Int) (a__last Int)
  (b (Array Int component_t)) (b__first Int)
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
  (forall ((a (Array Int component_t)) (b (Array Int component_t)))
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

(declare-const first Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const last Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort index_t 0)

(declare-fun index_tqtint (index_t) Int)

;; index_t'axiom
  (assert
  (forall ((i index_t))
  (and (<= 1 (index_tqtint i)) (<= (index_tqtint i) 1000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index_t index_t) Bool)

(declare-const dummy1 index_t)

(declare-datatypes ((index_t__ref 0))
(((index_t__refqtmk (index_t__content index_t)))))
(define-fun index_t__ref_index_t__content__projection ((a index_t__ref)) index_t 
  (index_t__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 1 1000)) (in_range2
                                     temp___expr_159)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content integer)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) integer 
  (t2b__content a))

(declare-fun temp_____aggregate_def_201 ((Array Int component_t) Int Int
  Int) (Array Int component_t))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_166)))

(declare-const rliteral component_t)

;; rliteral_axiom
  (assert (= (component_tqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___203 (Array Int component_t)))
  (forall ((temp___204 Int) (temp___205 Int) (temp___206 Int))
  (let ((temp___202 (temp_____aggregate_def_201 temp___203 temp___204
                    temp___205 temp___206)))
  (=>
  (and (dynamic_invariant temp___204 true true true true)
  (and (dynamic_invariant temp___205 true true true true) (dynamic_invariant2
  temp___206 true true true true)))
  (forall ((temp___207 Int))
  (ite (and (<= temp___204 temp___207) (<= temp___207 temp___205))
  (= (select temp___202 temp___207) rliteral)
  (= (select temp___202 temp___207) (select temp___203 temp___207)))))))))

(assert
;; defqtvc
 ;; File "loop_entry_test.ads", line 10, characters 0-0
  (not
  (forall ((a (Array Int component_t)) (a1 (Array Int component_t))
  (a_loop_entry (Array Int component_t)) (a2 (Array Int component_t))
  (temp___index_219 Int))
  (=> (= a1 a)
  (=> (dynamic_invariant first true false true true)
  (=> (dynamic_invariant last true false true true)
  (=> (= a_loop_entry a)
  (=>
  (let ((temp___195 first))
  (let ((temp___196 last))
  (exists ((j Int))
  (and (= j temp___195)
  (ite (= (and (ite (<= temp___195 j) true false) (ite (<= j temp___196) true
                                                  false)) true)
  (exists ((a3 (Array Int component_t)))
  (and (= a3 (store a j rliteral))
  (and (in_range2 j)
  (exists ((j1 Int))
  (and
  (= (bool_eq a2 1 1000 (temp_____aggregate_def_201 a_loop_entry first j1 0)
     1 1000) true)
  (and
  (= (and (ite (and (dynamic_property first last j1)
               (forall ((temp___199 Int))
               (=> (and (<= 1 temp___199) (<= temp___199 1000))
               (=>
               (or (< temp___196 temp___199)
               (or (< temp___199 temp___195) (< j1 temp___199)))
               (= (select a2 temp___199) (select a temp___199))))))
          true false) (ite (and (<= first j1) (<= j1 last)) true false)) true)
  (= j1 temp___196))))))) (= a2 a))))))
  (=> (<= 1 temp___index_219)
  (=> (<= temp___index_219 1000)
  (= (to_rep (select a2 temp___index_219)) (ite (and
                                                (<= first temp___index_219)
                                                (<= temp___index_219 
                                                last))
                                           0
                                           (to_rep
                                           (select a1 temp___index_219))))))))))))))
(check-sat)
(exit)
