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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
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

(declare-const tab__first integer)

(declare-const tab__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((ttD1__ref 0))
(((ttD1__refqtmk (ttD1__content integer)))))
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

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
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

(declare-datatypes ((ttB__ref 0))
(((ttB__refqtmk (ttB__content us_t)))))
(define-fun ttB__ref_ttB__content__projection ((a1 ttB__ref)) us_t (ttB__content
                                                                   a1))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_t)))))
(define-fun t__ref_t__content__projection ((a1 t__ref)) us_t (t__content a1))

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

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "p.adb", line 1, characters 0-0
  (not
  (forall ((tab (Array Int integer)) (j Int) (k Int) (j1 Int)
  (tab1 (Array Int integer)) (j2 Int) (j3 Int) (k1 Int)
  (tab2 (Array Int integer)) (j4 Int) (k2 Int) (j5 Int) (k3 Int)
  (tab3 (Array Int integer)) (j6 Int) (k4 Int) (j7 Int)
  (tab4 (Array Int integer)) (j8 Int) (j9 Int) (tab5 (Array Int integer))
  (j10 Int) (j11 Int) (k5 Int) (tab6 (Array Int integer)) (j12 Int) (k6 Int)
  (j13 Int) (k7 Int) (tab7 (Array Int integer)) (j14 Int) (k8 Int) (j15 Int)
  (k9 Int) (o integer))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (default_initial_assumption
  (of_array tab (to_rep tab__first) (to_rep tab__last)) false)
  (=>
  (and (dynamic_property1 a b (to_rep tab__first) (to_rep tab__last))
  (and (= (to_rep tab__first) a) (= (to_rep tab__last) b)))
  (=> (dynamic_invariant j false false true true)
  (=> (dynamic_invariant k false false true true)
  (=> (= j1 a)
  (=>
  (ite (<= j1 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j1)
  (and (and (<= (to_rep tab__first) j1) (<= j1 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab j1 o1))
  (let ((o2 (+ j1 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (and (dynamic_invariant j2 false true true true)
  (exists ((temp___171 Int)) (and (= temp___171 j2) (not (<= j2 b))))))))))))))
  (and (= tab1 tab) (= j2 j1)))
  (=> (= j3 a)
  (=> (= k1 0)
  (=>
  (let ((o1 (+ j3 k1)))
  (and (in_range1 o1)
  (ite (<= o1 b)
  (let ((o2 (+ j3 k1)))
  (and (in_range1 o2)
  (and (and (<= (to_rep tab__first) o2) (<= o2 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab1 o2 rliteral))
  (exists ((spark__branch Bool) (j16 Int) (k10 Int))
  (and
  (and (= spark__branch (ite (< j3 100) true false))
  (ite (= spark__branch true)
  (and (let ((o3 (+ j3 1))) (and (in_range1 o3) (= j16 o3))) (= k10 k1))
  (and (let ((o3 (+ k1 1))) (and (in_range1 o3) (= k10 o3))) (= j16 j3))))
  (and
  (and (dynamic_invariant k2 false true true true) (dynamic_invariant j4
  false true true true))
  (exists ((temp___179 Int))
  (and (= temp___179 j4)
  (exists ((temp___178 Int))
  (and (= temp___178 k2)
  (let ((o3 (+ j4 k2))) (and (in_range1 o3) (not (<= o3 b))))))))))))))))
  (and (and (= tab2 tab1) (= j4 j3)) (= k2 k1)))))
  (=> (= j5 a)
  (=> (= k3 0)
  (=>
  (ite (<= j5 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j5)
  (and (and (<= (to_rep tab__first) j5) (<= j5 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab2 j5 o1))
  (let ((o2 (+ j5 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (let ((o3 (+ k3 1)))
  (and (in_range1 o3)
  (exists ((k10 Int))
  (and (= k10 o3)
  (and
  (and (dynamic_invariant k4 false true true true) (dynamic_invariant j6
  false true true true))
  (exists ((temp___185 Int))
  (and (= temp___185 j6)
  (exists ((temp___186 Int)) (and (= temp___186 k4) (not (<= j6 b))))))))))))))))))))
  (and (and (= tab3 tab2) (= j6 j5)) (= k4 k3)))
  (=> (= j7 a)
  (=>
  (ite (<= j7 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j7)
  (and (and (<= (to_rep tab__first) j7) (<= j7 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab3 j7 o1))
  (let ((o2 (+ j7 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (and (in_range1 (- j16 1))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j8 1))) (= (to_rep (select tab4 l)) l)))
  (and (dynamic_invariant j8 false true true true)
  (exists ((temp___192 Int)) (and (= temp___192 j8) (not (<= j8 b))))))))))))))))
  (and (= tab4 tab3) (= j8 j7)))
  (=> (= j9 a)
  (=>
  (ite (<= j9 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j9)
  (and (and (<= (to_rep tab__first) j9) (<= j9 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab4 j9 o1))
  (let ((o2 (+ j9 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (and (in_range1 (- j16 1))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j10 1))) (= (to_rep (select tab5 l)) l)))
  (and (dynamic_invariant j10 false true true true)
  (exists ((temp___198 Int)) (and (= temp___198 j10) (not (<= j10 b))))))))))))))))
  (and (= tab5 tab4) (= j10 j9)))
  (=> (= j11 a)
  (=> (= k5 0)
  (=>
  (ite (<= j11 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j11)
  (and (and (<= (to_rep tab__first) j11) (<= j11 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab5 j11 o1))
  (let ((o2 (+ j11 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (let ((o3 (+ k5 1)))
  (and (in_range1 o3)
  (exists ((k10 Int))
  (and (= k10 o3)
  (and (in_range1 (+ a k10))
  (and
  (and (= j12 (+ a k6))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j12 1))) (= (to_rep (select tab6 l)) l)))
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- (+ a k6) 1))) (= (to_rep (select tab6 l)) l)))))
  (and
  (and (dynamic_invariant k6 false true true true) (dynamic_invariant j12
  false true true true))
  (exists ((temp___207 Int))
  (and (= temp___207 j12)
  (exists ((temp___208 Int)) (and (= temp___208 k6) (not (<= j12 b))))))))))))))))))))))
  (and (and (= tab6 tab5) (= j12 j11)) (= k6 k5)))
  (=> (= j13 a)
  (=> (= k7 0)
  (=>
  (ite (<= j13 b)
  (exists ((o1 integer))
  (and (= (to_rep o1) j13)
  (and (and (<= (to_rep tab__first) j13) (<= j13 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab6 j13 o1))
  (let ((o2 (+ j13 1)))
  (and (in_range1 o2)
  (exists ((j16 Int))
  (and (= j16 o2)
  (let ((o3 (+ k7 1)))
  (and (in_range1 o3)
  (exists ((k10 Int))
  (and (= k10 o3)
  (and (in_range1 (+ a k10))
  (and
  (and (= j14 (+ a k8))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j14 1))) (= (to_rep (select tab7 l)) l)))
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- (+ a k8) 1))) (= (to_rep (select tab7 l)) l)))))
  (and
  (and (dynamic_invariant k8 false true true true) (dynamic_invariant j14
  false true true true))
  (exists ((temp___217 Int))
  (and (= temp___217 j14)
  (exists ((temp___218 Int)) (and (= temp___218 k8) (not (<= j14 b))))))))))))))))))))))
  (and (and (= tab7 tab6) (= j14 j13)) (= k8 k7)))
  (=> (= j15 a)
  (=> (= k9 0)
  (=> (<= j15 b)
  (=> (= (to_rep o) j15)
  (=> (<= (to_rep tab__first) j15)
  (=> (<= j15 (to_rep tab__last))
  (let ((o1 (+ j15 1)))
  (=> (in_range1 o1)
  (forall ((j16 Int))
  (=> (= j16 o1)
  (let ((o2 (+ k9 1)))
  (=> (in_range1 o2)
  (forall ((k10 Int))
  (=> (= k10 o2)
  (=> (in_range1 (+ a k10))
  (=> (in_range1 (- j16 1))
  (let ((o3 (+ a k10))) (=> (in_range1 o3) (in_range1 (- o3 1)))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
