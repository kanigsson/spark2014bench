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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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

(declare-datatypes ((int_array__ref 0))
(((int_array__refqtmk (int_array__content us_t)))))
(define-fun int_array__ref_int_array__content__projection ((a int_array__ref)) us_t 
  (int_array__content a))

(declare-const s us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int positive))))))
(declare-fun slide1 ((Array Int positive) Int Int) (Array Int positive))

;; slide_eq
  (assert
  (forall ((a (Array Int positive)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int positive)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int positive)) (a__first Int) (a__last Int)
  (b (Array Int positive)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int positive)) (b (Array Int positive)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first2 (mk1 f l))) f) (= (to_rep (last2 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int positive))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int positive) (elts1 a))

(define-fun of_array1 ((a (Array Int positive)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

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

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq3 (us_t1 us_t1) Bool)

(declare-const dummy3 us_t1)

(declare-datatypes ((cut_points__ref 0))
(((cut_points__refqtmk (cut_points__content us_t1)))))
(define-fun cut_points__ref_cut_points__content__projection ((a cut_points__ref)) us_t1 
  (cut_points__content a))

(declare-const cut__first integer)

(declare-const cut__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r33b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant1 ((temp___expr_171 us_t)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_168 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_171)
                                     (last1 temp___expr_171)))
                                     (=> (= temp___do_toplevel_169 true)
                                     (=> (= temp___is_init_167 true)
                                     (= (first1 temp___expr_171) 1)))))

(define-fun dynamic_predicate ((temp___174 us_t)) Bool (= (first1 temp___174) 1))

(declare-datatypes ((tcutS__ref 0))
(((tcutS__refqtmk (tcutS__content us_t1)))))
(define-fun tcutS__ref_tcutS__content__projection ((a tcutS__ref)) us_t1 
  (tcutS__content a))

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_t1)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_t1 (t3b__content
                                                                   a))

(declare-datatypes ((t35b__ref 0))
(((t35b__refqtmk (t35b__content us_t1)))))
(define-fun t35b__ref_t35b__content__projection ((a t35b__ref)) us_t1 
  (t35b__content a))

(declare-fun ghc_sort__cut__cut__aggregate_def (Int Int Int) us_t1)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral positive)

;; rliteral_axiom
  (assert (= (positiveqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___411 Int) (temp___412 Int) (temp___413 Int))
  (let ((temp___410 (ghc_sort__cut__cut__aggregate_def temp___411 temp___412
                    temp___413)))
  (=> (dynamic_invariant temp___411 true true true true)
  (and
  (=> (dynamic_property1 1 2147483647 temp___412 temp___413)
  (and (= (first3 temp___410) temp___412) (= (last3 temp___410) temp___413)))
  (forall ((temp___414 Int))
  (= (select (to_array1 temp___410) temp___414) rliteral)))))))

(define-fun dynamic_invariant3 ((temp___expr_180 us_t1)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (not (= temp___skip_constant_177 true))
                                     (dynamic_property1 1 2147483647
                                     (first3 temp___expr_180)
                                     (last3 temp___expr_180))))

(define-fun dynamic_invariant4 ((temp___expr_215 us_t1)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (not (= temp___skip_constant_212 true))
                                     (and (dynamic_property1 1
                                     (+ (length s) 1)
                                     (first3 temp___expr_215)
                                     (last3 temp___expr_215))
                                     (and (= (first3 temp___expr_215) 1)
                                     (= (last3 temp___expr_215) (+ (length s) 1))))))

(define-fun default_initial_assumption ((temp___expr_217 us_t1)
  (temp___skip_top_level_218 Bool)) Bool (and (= (first3 temp___expr_217) 1)
                                         (= (last3 temp___expr_217) (+ 
                                         (length s) 1))))

(assert
;; defqtvc
 ;; File "ghc_sort.ads", line 6, characters 0-0
  (not
  (=> (dynamic_invariant1 s true false true true)
  (=> (< (last1 s) 2147483646)
  (let ((temp___415 (ghc_sort__cut__cut__aggregate_def 1 1 (+ (length s) 1))))
  (=> (= (first3 temp___415) 1)
  (=> (= (last3 temp___415) (+ (length s) 1))
  (=>
  (ite (<= (first3 temp___415) (last3 temp___415))
  (and (<= 1 (+ (length s) 1))
  (= (- (last3 temp___415) (first3 temp___415)) (- (+ (length s) 1) 1)))
  (< (+ (length s) 1) 1))
  (let ((ghc_sort__cut__cut__assume (of_array1 (to_array1 temp___415)
                                    (first3 temp___415) (last3 temp___415))))
  (forall ((cut (Array Int positive)))
  (=> (= cut (to_array1 ghc_sort__cut__cut__assume))
  (=> (= (to_rep cut__first) (first3 ghc_sort__cut__cut__assume))
  (=> (= (to_rep cut__last) (last3 ghc_sort__cut__cut__assume))
  (=>
  (and (dynamic_property1 1 (+ (length s) 1) (to_rep cut__first)
  (to_rep cut__last))
  (and (= (to_rep cut__first) 1) (= (to_rep cut__last) (+ (length s) 1))))
  (forall ((top Int))
  (=> (= top 1)
  (=> (dynamic_invariant top true false true true)
  (let ((o (first1 s)))
  (=> (in_range2 o)
  (forall ((x Int))
  (=> (= x o)
  (=> (dynamic_invariant x true false true true)
  (let ((o1 (+ (first1 s) 1)))
  (=> (in_range1 o1)
  (=> (in_range2 o1)
  (forall ((y Int))
  (=> (= y o1)
  (=> (dynamic_invariant y true false true true)
  (forall ((cut1 (Array Int positive)) (top1 Int) (x1 Int))
  (=>
  (ite (= (and (ite (<= (first1 s) y) true false) (ite (<= y (last1 s)) true
                                                  false)) true)
  (exists ((cut2 (Array Int positive)) (top2 Int) (x2 Int) (y1 Int))
  (and
  (and (and (<= (first1 s) x2) (<= x2 (last1 s)))
  (and (= x2 (- y1 1))
  (and (and (<= 1 top2) (<= top2 x2))
  (and (= (to_rep1 (select cut2 1)) 1)
  (and (= x2 (to_rep1 (select cut2 top2)))
  (and
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k top2))
  (let ((temp___458 (to_rep1 (select cut2 k))))
  (and (<= 1 temp___458) (<= temp___458 x2)))))
  (and
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- top2 1)))
  (< (to_rep1 (select cut2 k)) (to_rep1 (select cut2 (+ k 1))))))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- top2 1)))
  (or
  (and
  (forall ((l Int))
  (=>
  (and (<= (+ (to_rep1 (select cut2 k)) 1) l)
  (<= l (- (to_rep1 (select cut2 (+ k 1))) 1)))
  (< (to_rep (select (to_array s) (- l 1))) (to_rep (select (to_array s) l)))))
  (<= (to_rep (select (to_array s) (to_rep1 (select cut2 (+ k 1))))) 
  (to_rep (select (to_array s) (- (to_rep1 (select cut2 (+ k 1))) 1)))))
  (and
  (forall ((l Int))
  (=>
  (and (<= (+ (to_rep1 (select cut2 k)) 1) l)
  (<= l (- (to_rep1 (select cut2 (+ k 1))) 1)))
  (<= (to_rep (select (to_array s) l)) (to_rep (select (to_array s) (- l 1))))))
  (< (to_rep (select (to_array s) (- (to_rep1 (select cut2 (+ k 1))) 1))) 
  (to_rep (select (to_array s) (to_rep1 (select cut2 (+ k 1)))))))))))))))))
  (and
  (= (and (ite (and
               (and (dynamic_invariant top2 true true true true)
               (dynamic_invariant x2 true true true true)) (dynamic_invariant
               y1 true true true true))
          true false) (ite (and (<= (first1 s) y1) (<= y1 (last1 s))) true
                      false)) true)
  (and (and (<= (first1 s) y1) (<= y1 (last1 s)))
  (exists ((o2 Int))
  (and (= (to_rep (select (to_array s) y1)) o2)
  (and (and (<= (first1 s) x2) (<= x2 (last1 s)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array s) x2)) o3)
  (exists ((inc Bool))
  (and (= inc (ite (< o3 o2) true false))
  (exists ((y2 Int))
  (and
  (exists ((o4 Bool))
  (and
  (ite (= (and (ite (<= (first1 s) y1) true false) (ite (<= y1 (last1 s))
                                                   true false)) true)
  (and (and (<= (first1 s) y1) (<= y1 (last1 s)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array s) y1)) o5)
  (let ((temp___424 (- y1 1)))
  (and (and (<= (first1 s) temp___424) (<= temp___424 (last1 s)))
  (exists ((o6 Int))
  (and (= (to_rep (select (to_array s) temp___424)) o6)
  (= o4 (ite (= (ite (ite (< o6 o5) true false) 1 0) (ite inc 1 0)) true
        false)))))))))
  (= o4 false))
  (ite (= o4 true)
  (exists ((temp___loop_entry_423 Int))
  (and (= temp___loop_entry_423 y1)
  (exists ((temp___loop_entry_420 Int))
  (and (= temp___loop_entry_420 y1)
  (exists ((y3 Int))
  (and
  (and (<= temp___loop_entry_423 y3)
  (forall ((k Int))
  (=> (and (<= temp___loop_entry_420 k) (<= k y3))
  (=
  (< (to_rep (select (to_array s) (- k 1))) (to_rep (select (to_array s) k)))
  (= inc true)))))
  (and
  (= (and (ite (dynamic_invariant y3 true true true true) true false) 
  (ite (and (and (<= (first1 s) y3) (<= y3 (last1 s)))
       (=
       (< (to_rep (select (to_array s) (- y3 1))) (to_rep
                                                  (select (to_array s) y3)))
       (= inc true)))
  true false)) true)
  (let ((o5 (+ y3 1)))
  (and (in_range1 o5)
  (and (= y2 o5)
  (exists ((o6 Bool))
  (and
  (ite (= (and (ite (<= (first1 s) y2) true false) (ite (<= y2 (last1 s))
                                                   true false)) true)
  (and (and (<= (first1 s) y2) (<= y2 (last1 s)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array s) y2)) o7)
  (let ((temp___424 (- y2 1)))
  (and (and (<= (first1 s) temp___424) (<= temp___424 (last1 s)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array s) temp___424)) o8)
  (= o6 (ite (= (ite (ite (< o8 o7) true false) 1 0) (ite inc 1 0)) true
        false)))))))))
  (= o6 false)) (not (= o6 true)))))))))))))) (= y2 y1))))
  (let ((o4 (+ top2 1)))
  (and (in_range1 o4)
  (and (= top1 o4)
  (exists ((o5 positive))
  (and (= (to_rep1 o5) y2)
  (and (and (<= (to_rep cut__first) top1) (<= top1 (to_rep cut__last)))
  (and (= cut1 (store cut2 top1 o5))
  (and (= x1 y2)
  (let ((o6 (+ x1 1)))
  (and (in_range1 o6)
  (exists ((y3 Int))
  (and (= y3 o6)
  (and
  (=> (and (<= (first1 s) y3) (<= y3 (last1 s)))
  (or
  (and
  (forall ((l Int))
  (=>
  (and (<= (+ (to_rep1 (select cut1 (- top1 1))) 1) l)
  (<= l (- (to_rep1 (select cut1 top1)) 1)))
  (< (to_rep (select (to_array s) (- l 1))) (to_rep (select (to_array s) l)))))
  (<= (to_rep (select (to_array s) (to_rep1 (select cut1 top1)))) (to_rep
                                                                  (select 
                                                                  (to_array
                                                                  s) (- 
                                                                  (to_rep1
                                                                  (select cut1 top1)) 1)))))
  (and
  (forall ((l Int))
  (=>
  (and (<= (+ (to_rep1 (select cut1 (- top1 1))) 1) l)
  (<= l (- (to_rep1 (select cut1 top1)) 1)))
  (<= (to_rep (select (to_array s) l)) (to_rep (select (to_array s) (- l 1))))))
  (< (to_rep (select (to_array s) (- (to_rep1 (select cut1 top1)) 1))) 
  (to_rep (select (to_array s) (to_rep1 (select cut1 top1))))))))
  (not
  (= (and (ite (<= (first1 s) y3) true false) (ite (<= y3 (last1 s)) true
                                              false)) true))))))))))))))))))))))))))))
  (and (and (= cut1 cut) (= top1 top)) (= x1 x)))
  (forall ((cut2 (Array Int positive)) (top2 Int))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (<= x1 (last1 s)) true false))
  (ite (= spark__branch true)
  (let ((o2 (+ top1 1)))
  (and (in_range1 o2)
  (and (= top2 o2)
  (let ((o3 (length s)))
  (and (in_range1 o3)
  (let ((o4 (+ o3 1)))
  (and (in_range1 o4)
  (exists ((o5 positive))
  (and (= (to_rep1 o5) o4)
  (and (and (<= (to_rep cut__first) top2) (<= top2 (to_rep cut__last)))
  (= cut2 (store cut1 top2 o5)))))))))))) (and (= cut2 cut1) (= top2 top1)))))
  (=> (= top2 r33b)
  (=> (dynamic_invariant r33b true false true true)
  (=>
  (=> (<= 1 r33b)
  (and (and (<= (to_rep cut__first) 1) (<= 1 (to_rep cut__last)))
  (and (<= (to_rep cut__first) r33b) (<= r33b (to_rep cut__last)))))
  (let ((temp___466 (of_array1 cut2 1 r33b)))
  (forall ((ghc_sort__cut__result us_t1))
  (=>
  (= ghc_sort__cut__result (of_array1 (to_array1 temp___466)
                           (first3 temp___466) (last3 temp___466)))
  (forall ((o2 Bool))
  (=>
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (exists ((o6 Bool))
  (and
  (ite (= (first3 ghc_sort__cut__result) 1)
  (let ((temp___468 (last3 ghc_sort__cut__result)))
  (let ((o7 (length s)))
  (and (in_range1 o7)
  (let ((o8 (+ o7 1)))
  (and (in_range1 o8)
  (= o6 (and (ite (<= 1 temp___468) true false) (ite (<= temp___468 o8) true
                                                false))))))))
  (= o6 false))
  (ite (= o6 true)
  (= o5 (ite (forall ((temp___470 Int))
             (=>
             (and (<= (first3 ghc_sort__cut__result) temp___470)
             (<= temp___470 (last3 ghc_sort__cut__result)))
             (let ((c (to_rep1
                      (select (to_array1 ghc_sort__cut__result) temp___470))))
             (and (<= 1 c) (<= c (+ (length s) 1))))))
        true false))
  (= o5 false))))
  (ite (= o5 true)
  (and
  (and (<= (first3 ghc_sort__cut__result) 1)
  (<= 1 (last3 ghc_sort__cut__result)))
  (exists ((o6 Int))
  (and (= (to_rep1 (select (to_array1 ghc_sort__cut__result) 1)) o6)
  (= o4 (ite (= o6 1) true false))))) (= o4 false))))
  (ite (= o4 true)
  (let ((o5 (length s)))
  (and (in_range1 o5)
  (let ((o6 (+ o5 1)))
  (and (in_range1 o6)
  (let ((temp___472 (last3 ghc_sort__cut__result)))
  (and
  (and (<= (first3 ghc_sort__cut__result) temp___472)
  (<= temp___472 (last3 ghc_sort__cut__result)))
  (exists ((o7 Int))
  (and (= (to_rep1 (select (to_array1 ghc_sort__cut__result) temp___472)) o7)
  (= o3 (ite (= o7 o6) true false)))))))))) (= o3 false))))
  (ite (= o3 true)
  (and (in_range1 (- (last3 ghc_sort__cut__result) 1))
  (= o2 (ite (forall ((k Int))
             (=> (and (<= 1 k) (<= k (- (last3 ghc_sort__cut__result) 1)))
             (< (to_rep1 (select (to_array1 ghc_sort__cut__result) k)) 
             (to_rep1 (select (to_array1 ghc_sort__cut__result) (+ k 1))))))
        true false)))
  (= o2 false))))
  (=> (= o2 true)
  (forall ((usf Int))
  (let ((o3 (- (last3 ghc_sort__cut__result) 1)))
  (=> (in_range1 o3)
  (=> (= (and (ite (<= 1 usf) true false) (ite (<= usf o3) true false)) true)
  (let ((o4 (+ usf 1)))
  (=> (in_range1 o4) (<= (first3 ghc_sort__cut__result) o4))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
