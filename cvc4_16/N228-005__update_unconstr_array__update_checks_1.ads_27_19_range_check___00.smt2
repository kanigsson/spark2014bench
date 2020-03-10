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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort tindexB 0)

(declare-fun tindexBqtint (tindexB) Int)

;; tindexB'axiom
  (assert
  (forall ((i tindexB))
  (and (<= (- 128) (tindexBqtint i)) (<= (tindexBqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tindexB tindexB) Bool)

(declare-const dummy1 tindexB)

(declare-datatypes ((tindexB__ref 0))
(((tindexB__refqtmk (tindexB__content tindexB)))))
(define-fun tindexB__ref_tindexB__content__projection ((a tindexB__ref)) tindexB 
  (tindexB__content a))

(declare-const a__first tindexB)

(declare-const a__last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const new_val Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun to_rep1 ((x tindexB)) Int (tindexBqtint x))

(declare-fun of_rep1 (Int) tindexB)

;; inversion_axiom
  (assert
  (forall ((x tindexB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindexB)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i1 index)) (and (<= 1 (indexqtint i1)) (<= (indexqtint i1) 8))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 1 8)) (in_range3 temp___expr_159)))

(declare-sort t 0)

(declare-fun first (t) tindexB)

(declare-fun last (t) tindexB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((array_u__ref 0))
(((array_u__refqtmk (array_u__content us_t)))))
(define-fun array_u__ref_array_u__content__projection ((a array_u__ref)) us_t 
  (array_u__content a))

(declare-datatypes ((t12s__ref 0))
(((t12s__refqtmk (t12s__content us_t)))))
(define-fun t12s__ref_t12s__content__projection ((a t12s__ref)) us_t 
  (t12s__content a))

(declare-datatypes ((t14s__ref 0))
(((t14s__refqtmk (t14s__content us_t)))))
(define-fun t14s__ref_t14s__content__projection ((a t14s__ref)) us_t 
  (t14s__content a))

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_t)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_t 
  (t11b__content a))

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-fun temp_____aggregate_def_192 (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_401 (Int Int Int) us_t)

;; def_axiom
  (assert
  (forall ((temp___403 Int) (temp___404 Int) (temp___405 Int))
  (let ((temp___402 (temp_____aggregate_def_401 temp___403 temp___404
                    temp___405)))
  (=> (dynamic_invariant temp___403 true true true true)
  (and
  (=> (dynamic_property 1 8 temp___404 temp___405)
  (and (= (first1 temp___402) temp___404) (= (last1 temp___402) temp___405)))
  (forall ((temp___406 Int))
  (= (to_rep (select (to_array temp___402) temp___406)) temp___403)))))))

;; def_axiom
  (assert
  (forall ((temp___194 Int) (temp___195 Int) (temp___196 Int))
  (let ((temp___193 (temp_____aggregate_def_192 temp___194 temp___195
                    temp___196)))
  (=> (dynamic_invariant temp___194 true true true true)
  (and
  (=> (dynamic_property 1 8 temp___195 temp___196)
  (and (= (first1 temp___193) temp___195) (= (last1 temp___193) temp___196)))
  (forall ((temp___197 Int))
  (= (to_rep (select (to_array temp___193) temp___197)) temp___194)))))))

(define-fun dynamic_invariant2 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 1 8
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(assert
;; defqtvc
 ;; File "update_checks_1.ads", line 26, characters 0-0
  (not
  (forall ((a (Array Int integer)))
  (=> (dynamic_property 1 8 (to_rep1 a__first) (to_rep1 a__last))
  (=> (dynamic_invariant1 i true false true true)
  (=> (dynamic_invariant new_val true false true true)
  (let ((temp___407 (temp_____aggregate_def_401 new_val 2 i)))
  (=> (= (first1 temp___407) 2)
  (=> (= (last1 temp___407) i)
  (=>
  (ite (<= (first1 temp___407) (last1 temp___407))
  (and (<= 2 i) (= (- (last1 temp___407) (first1 temp___407)) (- i 2)))
  (< i 2))
  (let ((temp___409 (of_array (to_array temp___407) (first1 temp___407)
                    (last1 temp___407))))
  (=>
  (=> (<= 2 i)
  (and (and (<= (to_rep1 a__first) 2) (<= 2 (to_rep1 a__last)))
  (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))))
  (let ((temp___411 (of_array a 2 i)))
  (=>
  (ite (<= (first1 temp___409) (last1 temp___409))
  (and (<= (first1 temp___411) (last1 temp___411))
  (= (- (last1 temp___409) (first1 temp___409)) (- (last1 temp___411) 
  (first1 temp___411)))) (< (last1 temp___411) (first1 temp___411)))
  (forall ((usf (Array Int integer)))
  (=>
  (forall ((temp___413 Int))
  (ite (and (<= 2 temp___413) (<= temp___413 i))
  (= (select usf temp___413) (select (to_array temp___409) temp___413))
  (= (select usf temp___413) (select a temp___413))))
  (forall ((a1 (Array Int integer)))
  (=> (= a1 usf)
  (let ((temp___416 (temp_____aggregate_def_192 new_val 1 i)))
  (=> (= (first1 temp___416) 1)
  (=> (= (last1 temp___416) i) (=> (<= 1 i) (<= (to_rep1 a__first) 1)))))))))))))))))))))))
(check-sat)
(exit)
