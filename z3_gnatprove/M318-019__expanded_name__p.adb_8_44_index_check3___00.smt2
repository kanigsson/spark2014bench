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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a1 first first) a1) :pattern ((slide a1 first first)) ))))

;; slide_def
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a1 old_first new_first) i) (select a1 (- i (- new_first old_first)))) :pattern ((select 
  (slide a1 old_first new_first) i)) ))))))

(define-fun bool_eq ((a1 (Array Int integer)) (a__first Int) (a__last Int)
  (b1 (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a1 temp___idx_154)) (to_rep
                                                                  (select b1 (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a1 (Array Int integer)) (b1 (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b1 b__first b__last a1 a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a1 temp___idx_154)) (to_rep
                                         (select b1 (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const x__first integer)

(declare-const x__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes () ((ttD1__ref (ttD1__refqtmk (ttD1__content integer)))))
(define-fun ttD1__ref_ttD1__content__projection ((a1 ttD1__ref)) integer 
  (ttD1__content a1))

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

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a1 us_t)) (Array Int integer) (elts a1))

(define-fun of_array ((a1 (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a1 (mk f l)))

(define-fun first1 ((a1 us_t)) Int (to_rep (first (rt a1))))

(define-fun last1 ((a1 us_t)) Int (to_rep (last (rt a1))))

(define-fun length ((a1 us_t)) Int (ite (<= (first1 a1) (last1 a1))
                                   (+ (- (last1 a1) (first1 a1)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes () ((ttB__ref (ttB__refqtmk (ttB__content us_t)))))
(define-fun ttB__ref_ttB__content__projection ((a1 ttB__ref)) us_t (ttB__content
                                                                   a1))

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_t)))))
(define-fun t__ref_t__content__projection ((a1 t__ref)) us_t (t__content a1))

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content us_t)))))
(define-fun t5b__ref_t5b__content__projection ((a1 t5b__ref)) us_t (t5b__content
                                                                   a1))

(declare-fun p__x__aggregate_def (Int Int Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_159 us_t)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (not (= temp___skip_constant_156 true))
                                     (and (dynamic_property1 a b
                                     (first1 temp___expr_159)
                                     (last1 temp___expr_159))
                                     (and (= (first1 temp___expr_159) 
                                     a) (= (last1 temp___expr_159) b)))))

(define-fun default_initial_assumption ((temp___expr_161 us_t)
  (temp___skip_top_level_162 Bool)) Bool (and (= (first1 temp___expr_161) 
                                         a) (= (last1 temp___expr_161) 
                                         b)))

;; def_axiom
  (assert
  (forall ((temp___166 Int) (temp___167 Int) (temp___168 Int))
  (let ((temp___165 (p__x__aggregate_def temp___166 temp___167 temp___168)))
  (=> (dynamic_invariant temp___166 true true true true)
  (and
  (=> (dynamic_property1 a b temp___167 temp___168)
  (and (= (first1 temp___165) temp___167) (= (last1 temp___165) temp___168)))
  (forall ((temp___169 Int))
  (= (to_rep (select (to_array temp___165) temp___169)) temp___166)))))))

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assume
  (assert (dynamic_invariant b true false true true))

;; Assume
  (assert (<= a b))

(define-fun temp___170 () us_t (p__x__aggregate_def a a b))

;; Assume
  (assert (= (first1 temp___170) a))

;; Assume
  (assert (= (last1 temp___170) b))

;; Assert
  (assert
  (ite (<= (first1 temp___170) (last1 temp___170))
  (and (<= a b) (= (- (last1 temp___170) (first1 temp___170)) (- b a)))
  (< b a)))

(define-fun p__x__assume () us_t (of_array
                                 (slide (to_array temp___170)
                                 (first1 temp___170) a) a b))

(declare-const x (Array Int integer))

;; H
  (assert (= x (to_array p__x__assume)))

;; Assume
  (assert (= (to_rep x__first) (first1 p__x__assume)))

;; Assume
  (assert (= (to_rep x__last) (last1 p__x__assume)))

;; Assume
  (assert
  (and (dynamic_property1 a b (to_rep x__first) (to_rep x__last))
  (and (= (to_rep x__first) a) (= (to_rep x__last) b))))

(declare-const usf Int)

;; H
  (assert
  (= (and (ite (<= a usf) true false) (ite (<= usf b) true false)) true))

(assert
;; defqtvc
 ;; File "p.adb", line 2, characters 0-0
  (not (<= (to_rep x__first) usf)))
(check-sat)
