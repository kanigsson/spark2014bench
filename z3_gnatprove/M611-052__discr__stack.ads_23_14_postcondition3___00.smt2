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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep1 ((x index)) Int (indexqtint x))

(declare-fun of_rep1 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((intarray__ref (intarray__refqtmk (intarray__content us_t)))))
(define-fun intarray__ref_intarray__content__projection ((a intarray__ref)) us_t 
  (intarray__content a))

(declare-datatypes () ((t11s__ref (t11s__refqtmk (t11s__content us_t)))))
(define-fun t11s__ref_t11s__content__projection ((a t11s__ref)) us_t 
  (t11s__content a))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__stack__stack__n index)))))
(define-fun us_split_discrs_rec__stack__stack__n__projection ((a us_split_discrs)) index 
  (rec__stack__stack__n a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__stack__stack__top index)(rec__stack__stack__content us_t)))))
(define-fun us_split_fields_rec__stack__stack__top__projection ((a us_split_fields)) index 
  (rec__stack__stack__top a))

(define-fun us_split_fields_rec__stack__stack__content__projection ((a us_split_fields)) us_t 
  (rec__stack__stack__content a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__stack__stack__n (us_split_discrs1 a))) 
                        (to_rep1 (rec__stack__stack__n (us_split_discrs1 b))))
                        (and
                        (= (to_rep1
                           (rec__stack__stack__top (us_split_fields1 a))) 
                        (to_rep1
                        (rec__stack__stack__top (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__stack__stack__content (us_split_fields1 a))
                           (rec__stack__stack__content (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range4 ((rec__stack__stack__n1 Int)
  (a us_split_discrs)) Bool (= rec__stack__stack__n1 (to_rep1
                                                     (rec__stack__stack__n a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stack__stack__n__first__bit Int)

(declare-const stack__stack__n__last__bit Int)

(declare-const stack__stack__n__position Int)

;; stack__stack__n__first__bit_axiom
  (assert (<= 0 stack__stack__n__first__bit))

;; stack__stack__n__last__bit_axiom
  (assert (< stack__stack__n__first__bit stack__stack__n__last__bit))

;; stack__stack__n__position_axiom
  (assert (<= 0 stack__stack__n__position))

(declare-const stack__stack__top__first__bit Int)

(declare-const stack__stack__top__last__bit Int)

(declare-const stack__stack__top__position Int)

;; stack__stack__top__first__bit_axiom
  (assert (<= 0 stack__stack__top__first__bit))

;; stack__stack__top__last__bit_axiom
  (assert (< stack__stack__top__first__bit stack__stack__top__last__bit))

;; stack__stack__top__position_axiom
  (assert (<= 0 stack__stack__top__position))

(declare-const stack__stack__content__first__bit Int)

(declare-const stack__stack__content__last__bit Int)

(declare-const stack__stack__content__position Int)

;; stack__stack__content__first__bit_axiom
  (assert (<= 0 stack__stack__content__first__bit))

;; stack__stack__content__last__bit_axiom
  (assert
  (< stack__stack__content__first__bit stack__stack__content__last__bit))

;; stack__stack__content__position_axiom
  (assert (<= 0 stack__stack__content__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((stack__ref (stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int integer))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int integer) (elts1 a))

(define-fun of_array1 ((a (Array Int integer)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq5 (us_t1 us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes () ((m__ref (m__refqtmk (m__content us_t1)))))
(define-fun m__ref_m__content__projection ((a m__ref)) us_t1 (m__content a))

(declare-fun to__ (us_rep) us_t1)

(declare-fun to____function_guard (us_t1 us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_177 us_rep)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (let ((temp___178 (rec__stack__stack__n
                                                       (us_split_discrs1
                                                       temp___expr_177))))
                                     (and (dynamic_property 1
                                     (to_rep1 temp___178)
                                     (first1
                                     (rec__stack__stack__content
                                     (us_split_fields1 temp___expr_177)))
                                     (last1
                                     (rec__stack__stack__content
                                     (us_split_fields1 temp___expr_177))))
                                     (and
                                     (= (first1
                                        (rec__stack__stack__content
                                        (us_split_fields1 temp___expr_177))) 1)
                                     (= (last1
                                        (rec__stack__stack__content
                                        (us_split_fields1 temp___expr_177))) 
                                     (to_rep1 temp___178))))))

(define-fun dynamic_invariant2 ((temp___expr_184 us_t1)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (not (= temp___skip_constant_181 true))
                                     (dynamic_property1 1 2147483647
                                     (first3 temp___expr_184)
                                     (last3 temp___expr_184))))

(declare-datatypes () ((t6b__ref (t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

;; to____post_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant1 s true true true true)
     (let ((result (to__ s)))
     (=> (to____function_guard result s) (dynamic_invariant2 result true
     false true true)))) :pattern ((to__ s)) )))

;; to____def_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant1 s true true true true)
     (= (to__ s) (let ((temp___209 (let ((temp___207 (to_rep1
                                                     (rec__stack__stack__top
                                                     (us_split_fields1 s)))))
                                   (let ((temp___206 1))
                                   (let ((temp___208 (rec__stack__stack__content
                                                     (us_split_fields1 s))))
                                   (of_array (to_array temp___208) temp___206
                                   temp___207))))))
                 (of_array1 (to_array temp___209) (first1 temp___209)
                 (last1 temp___209))))) :pattern ((to__ s)) )))

(declare-fun to_but_top (us_rep) us_t1)

(declare-fun to_but_top__function_guard (us_t1 us_rep) Bool)

(declare-datatypes () ((t12b__ref (t12b__refqtmk (t12b__content us_t)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_t 
  (t12b__content a))

;; to_but_top__post_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant1 s true true true true)
     (let ((result (to_but_top s)))
     (=> (to_but_top__function_guard result s) (dynamic_invariant2 result
     true false true true)))) :pattern ((to_but_top s)) )))

;; to_but_top__def_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant1 s true true true true)
     (= (to_but_top s) (let ((temp___233 (let ((temp___231 (- (to_rep1
                                                              (rec__stack__stack__top
                                                              (us_split_fields1
                                                              s))) 1)))
                                         (let ((temp___230 1))
                                         (let ((temp___232 (rec__stack__stack__content
                                                           (us_split_fields1
                                                           s))))
                                         (of_array (to_array temp___232)
                                         temp___230 temp___231))))))
                       (of_array1 (to_array temp___233) (first1 temp___233)
                       (last1 temp___233))))) :pattern ((to_but_top s)) )))

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (is_full s) true)
     (<= (last1 (rec__stack__stack__content (us_split_fields1 s))) (to_rep1
                                                                   (rec__stack__stack__top
                                                                   (us_split_fields1
                                                                   s))))) :pattern (
  (is_full s)) )))

(declare-fun top (us_rep) Int)

(declare-fun top__function_guard (Int us_rep) Bool)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

;; top__post_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (is_empty__function_guard (is_empty s1) s1))
     (=>
     (and (dynamic_invariant1 s true true true true)
     (not (= (is_empty s) true)))
     (let ((result (top s)))
     (=> (top__function_guard result s) (dynamic_invariant result true false
     true true))))) :pattern ((top s)) )))

;; top__def_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant1 s true true true true)
     (= (top s) (to_rep1 (rec__stack__stack__top (us_split_fields1 s))))) :pattern (
  (top s)) )))

(declare-const s__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 100)) (in_range2 temp___expr_164)))

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (is_empty s) true)
     (< (to_rep1 (rec__stack__stack__top (us_split_fields1 s))) 1)) :pattern (
  (is_empty s)) )))

(declare-const s__split_fields us_split_fields)

(declare-const s__split_fields1 us_split_fields)

;; H
  (assert (= s__split_fields1 s__split_fields))

;; Assume
  (assert (dynamic_invariant1 (us_repqtmk s__split_discrs s__split_fields)
  true false true true))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; H
  (assert
  (forall ((s__split_fields2 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk s__split_discrs s__split_fields2))
  (us_repqtmk s__split_discrs s__split_fields2))))

;; Assume
  (assert
  (not (= (is_full (us_repqtmk s__split_discrs s__split_fields)) true)))

(define-fun usf () us_rep (us_repqtmk s__split_discrs s__split_fields))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 (rec__stack__stack__top s__split_fields)) o))

(define-fun o1 () Int (+ o 1))

;; Ensures
  (assert (in_range2 o1))

(declare-const o2 index)

;; Ensures
  (assert (= (to_rep1 o2) o1))

(declare-const s__split_fields2 us_split_fields)

;; H
  (assert
  (= s__split_fields2 (us_split_fieldsqtmk o2
                      (rec__stack__stack__content s__split_fields))))

(define-fun temp___298 () us_t (rec__stack__stack__content s__split_fields2))

(declare-const o3 integer)

;; Ensures
  (assert (= (to_rep o3) x))

(declare-const temp___299 Int)

;; Ensures
  (assert (= (to_rep1 (rec__stack__stack__top s__split_fields2)) temp___299))

;; Assert
  (assert
  (and (<= (first1 temp___298) temp___299)
  (<= temp___299 (last1 temp___298))))

(declare-const s__split_fields3 us_split_fields)

;; H
  (assert
  (= s__split_fields3 (us_split_fieldsqtmk
                      (rec__stack__stack__top s__split_fields2)
                      (us_tqtmk
                      (store (to_array
                             (rec__stack__stack__content s__split_fields2)) 
                      temp___299 o3)
                      (rt (rec__stack__stack__content s__split_fields2))))))

;; H
  (assert
  (forall ((s__split_fields4 us_split_fields)) (top__function_guard
  (top (us_repqtmk s__split_discrs s__split_fields4))
  (us_repqtmk s__split_discrs s__split_fields4))))

(assert
;; defqtvc
 ;; File "stack.ads", line 21, characters 0-0
  (not (= (top (us_repqtmk s__split_discrs s__split_fields3)) x)))
(check-sat)
