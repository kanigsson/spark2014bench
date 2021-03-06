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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort tTaSP1 0)

(declare-fun tTaSP1qtint (tTaSP1) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP1))
  (and (<= 1 (tTaSP1qtint i)) (<= (tTaSP1qtint i) 1000))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tTaSP1 tTaSP1) Bool)

(declare-const dummy3 tTaSP1)

(declare-datatypes ()
((tTaSP1__ref (tTaSP1__refqtmk (tTaSP1__content tTaSP1)))))
(define-fun tTaSP1__ref_tTaSP1__content__projection ((a tTaSP1__ref)) tTaSP1 
  (tTaSP1__content a))

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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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
  (y1 us_t)) Bool (bool_eq (elts x1) (to_rep (first (rt x1)))
                  (to_rep (last (rt x1))) (elts y1) (to_rep (first (rt y1)))
                  (to_rep (last (rt y1)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes () ((text__ref (text__refqtmk (text__content us_t)))))
(define-fun text__ref_text__content__projection ((a text__ref)) us_t 
  (text__content a))

(declare-datatypes () ((t8s__ref (t8s__refqtmk (t8s__content us_t)))))
(define-fun t8s__ref_t8s__content__projection ((a t8s__ref)) us_t (t8s__content
                                                                  a))

(declare-datatypes () ((t10s__ref (t10s__refqtmk (t10s__content us_t)))))
(define-fun t10s__ref_t10s__content__projection ((a t10s__ref)) us_t 
  (t10s__content a))

(declare-datatypes () ((t7b__ref (t7b__refqtmk (t7b__content us_t)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_t (t7b__content
                                                                  a))

(declare-datatypes () ((t10b__ref (t10b__refqtmk (t10b__content us_t)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_t 
  (t10b__content a))

(declare-const a (Array Int integer))

(declare-const l Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 x true false true true))

;; Assume
  (assert (dynamic_invariant1 y true false true true))

;; Assume
  (assert (and (and (<= 1 x) (<= x 1000)) (and (<= 1 y) (<= y 1000))))

(define-fun usf () Bool (= x y))

(define-fun usf1 () Bool (not (= (to_rep (select a x)) (to_rep (select a y)))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant l false false true true))

(declare-const l1 Int)

;; H
  (assert (= l1 0))

(declare-const l2 Int)

;; H
  (assert (in_range1 (+ x l1)))

;; H
  (assert (or (not (<= (+ x l1) 1000)) (in_range1 (+ y l1))))

(declare-const o Bool)

(declare-const o1 Int)

(declare-const o2 Int)

;; H
  (assert
  (ite (and (<= (+ x l1) 1000) (<= (+ y l1) 1000))
  (let ((o3 (+ y l1)))
  (and (in_range1 o3)
  (and (and (<= 1 o3) (<= o3 1000))
  (and (= (to_rep (select a o3)) o1)
  (let ((o4 (+ x l1)))
  (and (in_range1 o4)
  (and (and (<= 1 o4) (<= o4 1000))
  (and (= (to_rep (select a o4)) o2) (= o (ite (= o2 o1) true false))))))))))
  (= o false)))

;; H
  (assert
  (ite (= o true)
  (let ((o3 (+ x l1)))
  (and (in_range1 o3)
  (exists ((r5b Int))
  (and (= r5b o3)
  (and (dynamic_invariant2 r5b true false true true)
  (let ((o4 (+ y l1)))
  (and (in_range1 o4)
  (exists ((r8b Int))
  (and (= r8b o4)
  (and (dynamic_invariant2 r8b true false true true)
  (and
  (=> (<= y r8b)
  (and (and (<= 1 y) (<= y 1000)) (and (<= 1 r8b) (<= r8b 1000))))
  (and
  (=> (<= x r5b)
  (and (and (<= 1 x) (<= x 1000)) (and (<= 1 r5b) (<= r5b 1000))))
  (exists ((l3 Int) (r5b1 Int) (r8b1 Int))
  (and
  (= (let ((temp___208 (of_array a y r8b1)))
     (let ((temp___207 (of_array a x r5b1)))
     (bool_eq (to_array temp___207) (first1 temp___207) (last1 temp___207)
     (to_array temp___208) (first1 temp___208) (last1 temp___208)))) true)
  (and
  (and
  (and
  (and
  (and (dynamic_invariant2 r5b1 true true true true) (dynamic_invariant2 r8b1
  true true true true)) (dynamic_invariant l3 false true true true))
  (= (+ x l3) r5b1)) (= (+ y l3) r8b1))
  (exists ((temp___209 Int))
  (and (= temp___209 l3)
  (let ((o5 (+ l3 1)))
  (and (in_range1 o5)
  (and (= l2 o5)
  (exists ((o6 Bool))
  (and
  (let ((o7 (+ x l2)))
  (and (in_range1 o7)
  (and (or (not (<= o7 1000)) (in_range1 (+ y l2)))
  (ite (and (<= o7 1000) (<= (+ y l2) 1000))
  (let ((o8 (+ y l2)))
  (and (in_range1 o8)
  (and (and (<= 1 o8) (<= o8 1000))
  (exists ((o9 Int))
  (and (= (to_rep (select a o8)) o9)
  (let ((o10 (+ x l2)))
  (and (in_range1 o10)
  (and (and (<= 1 o10) (<= o10 1000))
  (exists ((o11 Int))
  (and (= (to_rep (select a o10)) o11) (= o6 (ite (= o11 o9) true false))))))))))))
  (= o6 false))))) (not (= o6 true)))))))))))))))))))))))) (= l2 l1)))

(declare-const longest_common_prefix__lcp__result Int)

;; H
  (assert (= longest_common_prefix__lcp__result l2))

(define-fun o3 () Int (+ y longest_common_prefix__lcp__result))

;; Ensures
  (assert (in_range1 o3))

(define-fun temp___213 () Int (- o3 1))

;; Assert
  (assert
  (=> (<= y temp___213)
  (and (and (<= 1 y) (<= y 1000))
  (and (<= 1 temp___213) (<= temp___213 1000)))))

(define-fun temp___217 () us_t (of_array a y temp___213))

(define-fun o4 () Int (+ x longest_common_prefix__lcp__result))

;; Ensures
  (assert (in_range1 o4))

(define-fun temp___212 () Int (- o4 1))

;; Assert
  (assert
  (=> (<= x temp___212)
  (and (and (<= 1 x) (<= x 1000))
  (and (<= 1 temp___212) (<= temp___212 1000)))))

(define-fun temp___216 () us_t (of_array a x temp___212))

;; H
  (assert
  (= (bool_eq (to_array temp___216) (first1 temp___216) (last1 temp___216)
     (to_array temp___217) (first1 temp___217) (last1 temp___217)) true))

(declare-const o5 Bool)

;; H
  (assert (in_range1 (+ longest_common_prefix__lcp__result x)))

;; H
  (assert
  (let ((o6 (+ longest_common_prefix__lcp__result x)))
  (ite (not
       (= (and (ite (<= 1 o6) true false) (ite (<= o6 1000) true false)) true))
  (= o5 true)
  (let ((o7 (+ longest_common_prefix__lcp__result y)))
  (and (in_range1 o7)
  (= o5 (ite (= (and (ite (<= 1 o7) true false) (ite (<= o7 1000) true false)) true)
        false true)))))))

;; H
  (assert (not (= o5 true)))

(define-fun o6 () Int (+ y longest_common_prefix__lcp__result))

;; Ensures
  (assert (in_range1 o6))

(assert
;; defqtvc
 ;; File "longest_common_prefix.ads", line 8, characters 0-0
  (not (<= 1 o6)))
(check-sat)

(exit)
