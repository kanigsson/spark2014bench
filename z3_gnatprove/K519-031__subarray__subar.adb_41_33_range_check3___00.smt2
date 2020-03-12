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

(define-fun to_rep ((x1 integer)) Int (integerqtint x1))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x1 integer))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert
  (forall ((x1 integer)) (! (in_range1 (to_rep x1)) :pattern ((to_rep x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range1 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                               (of_rep x1))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
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
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
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
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-sort tone_twentyB 0)

(declare-fun tone_twentyBqtint (tone_twentyB) Int)

;; tone_twentyB'axiom
  (assert
  (forall ((i tone_twentyB))
  (and (<= (- 128) (tone_twentyBqtint i)) (<= (tone_twentyBqtint i) 127))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tone_twentyB tone_twentyB) Bool)

(declare-const dummy1 tone_twentyB)

(declare-datatypes ()
((tone_twentyB__ref
 (tone_twentyB__refqtmk (tone_twentyB__content tone_twentyB)))))
(define-fun tone_twentyB__ref_tone_twentyB__content__projection ((a tone_twentyB__ref)) tone_twentyB 
  (tone_twentyB__content a))

(declare-const z__first tone_twentyB)

(declare-const z__last tone_twentyB)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun to_rep1 ((x1 tone_twentyB)) Int (tone_twentyBqtint x1))

(declare-fun of_rep1 (Int) tone_twentyB)

;; inversion_axiom
  (assert
  (forall ((x1 tone_twentyB))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 tone_twentyB)) (! (in_range2
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range2 x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                 (of_rep1 x1))) )))

(declare-sort one_twenty 0)

(declare-fun one_twentyqtint (one_twenty) Int)

;; one_twenty'axiom
  (assert
  (forall ((i one_twenty))
  (and (<= 1 (one_twentyqtint i)) (<= (one_twentyqtint i) 20))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 20)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (one_twenty one_twenty) Bool)

(declare-const dummy2 one_twenty)

(declare-datatypes ()
((one_twenty__ref (one_twenty__refqtmk (one_twenty__content one_twenty)))))
(define-fun one_twenty__ref_one_twenty__content__projection ((a one_twenty__ref)) one_twenty 
  (one_twenty__content a))

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 20)) (in_range3 temp___expr_161)))

(declare-sort one_ten 0)

(declare-fun one_tenqtint (one_ten) Int)

;; one_ten'axiom
  (assert
  (forall ((i one_ten))
  (and (<= 1 (one_tenqtint i)) (<= (one_tenqtint i) 10))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (one_ten one_ten) Bool)

(declare-const dummy3 one_ten)

(declare-datatypes ()
((one_ten__ref (one_ten__refqtmk (one_ten__content one_ten)))))
(define-fun one_ten__ref_one_ten__content__projection ((a one_ten__ref)) one_ten 
  (one_ten__content a))

(declare-sort t 0)

(declare-fun first (t) tone_twentyB)

(declare-fun last (t) tone_twentyB)

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
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
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

(define-fun bool_eq1 ((x1 us_t)
  (y us_t)) Bool (bool_eq (elts x1) (to_rep1 (first (rt x1)))
                 (to_rep1 (last (rt x1))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((smaller__ref (smaller__refqtmk (smaller__content us_t)))))
(define-fun smaller__ref_smaller__content__projection ((a smaller__ref)) us_t 
  (smaller__content a))

(declare-datatypes ()
((smaller_local__ref (smaller_local__refqtmk (smaller_local__content us_t)))))
(define-fun smaller_local__ref_smaller_local__content__projection ((a smaller_local__ref)) us_t 
  (smaller_local__content a))

(declare-datatypes () ((t7b__ref (t7b__refqtmk (t7b__content us_t)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_t (t7b__content
                                                                  a))

(define-fun dynamic_invariant1 ((temp___expr_255 us_t)
  (temp___is_init_251 Bool) (temp___skip_constant_252 Bool)
  (temp___do_toplevel_253 Bool)
  (temp___do_typ_inv_254 Bool)) Bool (=>
                                     (not (= temp___skip_constant_252 true))
                                     (and (dynamic_property (- x 1) (+ 
                                     x 1) (first1 temp___expr_255)
                                     (last1 temp___expr_255))
                                     (and
                                     (= (first1 temp___expr_255) (- x 1))
                                     (= (last1 temp___expr_255) (+ x 1))))))

(define-fun default_initial_assumption ((temp___expr_257 us_t)
  (temp___skip_top_level_258 Bool)) Bool (and
                                         (= (first1 temp___expr_257) (- 
                                         x 1))
                                         (= (last1 temp___expr_257) (+ 
                                         x 1))))

(declare-fun temp_____aggregate_def_274 (Int Int Int) us_t)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-datatypes ()
((tsmaller_localB__ref
 (tsmaller_localB__refqtmk (tsmaller_localB__content us_t)))))
(define-fun tsmaller_localB__ref_tsmaller_localB__content__projection ((a tsmaller_localB__ref)) us_t 
  (tsmaller_localB__content a))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___276 Int) (temp___277 Int) (temp___278 Int))
  (let ((temp___275 (temp_____aggregate_def_274 temp___276 temp___277
                    temp___278)))
  (=> (dynamic_invariant2 temp___276 true true true true)
  (and
  (=> (dynamic_property 1 10 temp___277 temp___278)
  (and (= (first1 temp___275) temp___277) (= (last1 temp___275) temp___278)))
  (forall ((temp___279 Int))
  (= (select (to_array temp___275) temp___279) rliteral)))))))

(define-fun dynamic_invariant3 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 1 10)) (in_range4 temp___expr_168)))

(declare-const z (Array Int integer))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert (and (< 1 x) (< x 10)))

;; Assume
  (assert (default_initial_assumption
  (of_array z (to_rep1 z__first) (to_rep1 z__last)) false))

;; Assume
  (assert
  (and (dynamic_property (- x 1) (+ x 1) (to_rep1 z__first)
  (to_rep1 z__last))
  (and (= (to_rep1 z__first) (- x 1)) (= (to_rep1 z__last) (+ x 1)))))

;; H
  (assert (<= (- x 1) (+ x 1)))

(assert
;; defqtvc
 ;; File "subar.ads", line 27, characters 0-0
  (not (<= 1 (- x 1))))
(check-sat)
