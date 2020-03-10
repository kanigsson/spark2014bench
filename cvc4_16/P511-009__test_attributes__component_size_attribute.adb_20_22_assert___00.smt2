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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
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
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const a1__first integer)

(declare-const a1__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x1 Int)) Bool (and (<= first_int x1) (<= x1 last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((tarray1D1__ref 0))
(((tarray1D1__refqtmk (tarray1D1__content integer)))))
(define-fun tarray1D1__ref_tarray1D1__content__projection ((a tarray1D1__ref)) integer 
  (tarray1D1__content a))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x1) (to_rep (first (rt x1)))
                 (to_rep (last (rt x1))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((tarray1B__ref 0))
(((tarray1B__refqtmk (tarray1B__content us_t)))))
(define-fun tarray1B__ref_tarray1B__content__projection ((a tarray1B__ref)) us_t 
  (tarray1B__content a))

(declare-datatypes ((array1__ref 0))
(((array1__refqtmk (array1__content us_t)))))
(define-fun array1__ref_array1__content__projection ((a array1__ref)) us_t 
  (array1__content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_t))))))
(declare-fun slide1 ((Array Int us_t) Int Int) (Array Int us_t))

;; slide_eq
  (assert
  (forall ((a (Array Int us_t)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_t)) (a__first Int) (a__last Int)
  (b (Array Int us_t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq1 (select a temp___idx_156)
                              (select b (+ (- b__first a__first) temp___idx_156))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_t)) (b (Array Int us_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq1 (select a temp___idx_156)
     (select b (+ (- b__first a__first) temp___idx_156))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const dummy3 (Array Int us_t))

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

(declare-fun user_eq3 ((Array Int us_t) (Array Int us_t)) Bool)

(declare-sort tarray2D1 0)

(declare-fun tarray2D1qtint (tarray2D1) Int)

;; tarray2D1'axiom
  (assert
  (forall ((i tarray2D1))
  (and (<= 1 (tarray2D1qtint i)) (<= (tarray2D1qtint i) 1))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (tarray2D1 tarray2D1) Bool)

(declare-const dummy4 tarray2D1)

(declare-datatypes ((tarray2D1__ref 0))
(((tarray2D1__refqtmk (tarray2D1__content tarray2D1)))))
(define-fun tarray2D1__ref_tarray2D1__content__projection ((a tarray2D1__ref)) tarray2D1 
  (tarray2D1__content a))

(define-fun dynamic_invariant1 ((temp___expr_205 (Array Int us_t))
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (forall ((temp___206 Int))
                                     (=>
                                     (and (<= 1 temp___206)
                                     (<= temp___206 1))
                                     (and (dynamic_property1 1 x
                                     (first1
                                     (select temp___expr_205 temp___206))
                                     (last1
                                     (select temp___expr_205 temp___206)))
                                     (and
                                     (= (first1
                                        (select temp___expr_205 temp___206)) 1)
                                     (= (last1
                                        (select temp___expr_205 temp___206)) 
                                     x))))))

(define-fun default_initial_assumption ((temp___expr_208 (Array Int us_t))
  (temp___skip_top_level_209 Bool)) Bool (forall ((temp___210 Int))
                                         (=>
                                         (and (<= 1 temp___210)
                                         (<= temp___210 1))
                                         (and
                                         (= (first1
                                            (select temp___expr_208 temp___210)) 1)
                                         (= (last1
                                            (select temp___expr_208 temp___210)) 
                                         x)))))

(declare-datatypes ((t22b__ref 0))
(((t22b__refqtmk (t22b__content us_t)))))
(define-fun t22b__ref_t22b__content__projection ((a t22b__ref)) us_t 
  (t22b__content a))

(declare-fun component_size_attribute__p__a1__aggregate_def (Int Int
  Int) us_t)

(declare-fun component_size_attribute__p__a2__aggregate_def (us_t) (Array Int us_t))

(define-fun dynamic_invariant2 ((temp___expr_195 us_t)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (not (= temp___skip_constant_192 true))
                                     (and (dynamic_property1 1 x
                                     (first1 temp___expr_195)
                                     (last1 temp___expr_195))
                                     (and (= (first1 temp___expr_195) 1)
                                     (= (last1 temp___expr_195) x)))))

(define-fun default_initial_assumption1 ((temp___expr_197 us_t)
  (temp___skip_top_level_198 Bool)) Bool (and (= (first1 temp___expr_197) 1)
                                         (= (last1 temp___expr_197) x)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___241 Int) (temp___242 Int) (temp___243 Int))
  (let ((temp___240 (component_size_attribute__p__a1__aggregate_def
                    temp___241 temp___242 temp___243)))
  (=> (dynamic_invariant temp___241 true true true true)
  (and
  (=> (dynamic_property1 1 x temp___242 temp___243)
  (and (= (first1 temp___240) temp___242) (= (last1 temp___240) temp___243)))
  (forall ((temp___244 Int))
  (= (select (to_array temp___240) temp___244) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___249 us_t))
  (=> (dynamic_invariant2 temp___249 true true true true)
  (forall ((temp___250 Int))
  (= (select (component_size_attribute__p__a2__aggregate_def temp___249) temp___250) temp___249)))))

(assert
;; defqtvc
 ;; File "component_size_attribute.adb", line 13, characters 0-0
  (not
  (=> (dynamic_invariant x true false true true)
  (let ((temp___245 (component_size_attribute__p__a1__aggregate_def 1 1 x)))
  (=> (= (first1 temp___245) 1)
  (=> (= (last1 temp___245) x)
  (=>
  (ite (<= (first1 temp___245) (last1 temp___245))
  (and (<= 1 x) (= (- (last1 temp___245) (first1 temp___245)) (- x 1)))
  (< x 1))
  (let ((component_size_attribute__p__a1__assume (of_array
                                                 (to_array temp___245)
                                                 (first1 temp___245)
                                                 (last1 temp___245))))
  (forall ((a1 (Array Int integer)))
  (=> (= a1 (to_array component_size_attribute__p__a1__assume))
  (=> (= (to_rep a1__first) (first1 component_size_attribute__p__a1__assume))
  (=> (= (to_rep a1__last) (last1 component_size_attribute__p__a1__assume))
  (=>
  (and (dynamic_property1 1 x (to_rep a1__first) (to_rep a1__last))
  (and (= (to_rep a1__first) 1) (= (to_rep a1__last) x)))
  (forall ((o Int))
  (=> (= (to_rep a1__last) o)
  (forall ((o1 Int))
  (=> (= (to_rep a1__first) o1)
  (forall ((a2 (Array Int us_t)))
  (=>
  (= a2 (component_size_attribute__p__a2__aggregate_def (of_array a1 o1 o)))
  (=> (dynamic_invariant1 a2 true false true true) (<= 0 component__size1)))))))))))))))))))))
(check-sat)
(exit)
