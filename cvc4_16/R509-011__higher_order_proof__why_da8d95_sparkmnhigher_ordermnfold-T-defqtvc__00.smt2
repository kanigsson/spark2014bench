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

(declare-sort small_index 0)

(declare-fun small_indexqtint (small_index) Int)

;; small_index'axiom
  (assert
  (forall ((i small_index))
  (and (<= 1 (small_indexqtint i)) (<= (small_indexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (small_index small_index) Bool)

(declare-const dummy1 small_index)

(declare-datatypes ((small_index__ref 0))
(((small_index__refqtmk (small_index__content small_index)))))
(define-fun small_index__ref_small_index__content__projection ((a small_index__ref)) small_index 
  (small_index__content a))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) integer)

(declare-fun set (map1 Int Int integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a integer))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_170 Int)
                             (temp___idx_171 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_170)
                             (<= temp___idx_170 a__last))
                             (and (<= a__first_2 temp___idx_171)
                             (<= temp___idx_171 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_170 temp___idx_171)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_170)
                             (+ (- b__first_2 a__first_2) temp___idx_171)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_170 Int) (temp___idx_171 Int))
  (=>
  (and (and (<= a__first temp___idx_170) (<= temp___idx_170 a__last))
  (and (<= a__first_2 temp___idx_171) (<= temp___idx_171 a__last_2)))
  (= (to_rep (get a temp___idx_170 temp___idx_171)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_170)
                                                    (+ (- b__first_2 a__first_2) temp___idx_171)))))))))))

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

(declare-sort t1 0)

(declare-fun first1 (t1) integer)

(declare-fun last1 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first1 (mk1 f l))) f) (= (to_rep (last1 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))
(define-fun to_array ((a us_t)) map1 (elts a))

(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t (us_tqtmk a (mk f l) (mk1 f2 l2)))

(define-fun first2 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

(define-fun first_2 ((a us_t)) Int (to_rep (first1 (rt_2 a))))

(define-fun last_2 ((a us_t)) Int (to_rep (last1 (rt_2 a))))

(define-fun length_2 ((a us_t)) Int (ite (<= (first_2 a) (last_2 a))
                                    (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property2 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property range_first1 range_last1 f1 l1)
                 (dynamic_property1 range_first2 range_last2 f2 l2)))

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
                 (to_rep (last (rt x))) (to_rep (first1 (rt_2 x)))
                 (to_rep (last1 (rt_2 x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y))) (to_rep (first1 (rt_2 y)))
                 (to_rep (last1 (rt_2 y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((small_matrix__ref 0))
(((small_matrix__refqtmk (small_matrix__content us_t)))))
(define-fun small_matrix__ref_small_matrix__content__projection ((a small_matrix__ref)) us_t 
  (small_matrix__content a))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__7__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-fun in_range3 (us_t Int Int Int) Bool)

(declare-fun in_range__function_guard (Bool us_t Int Int Int) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range4
                                    temp___expr_39)))

(declare-sort index_1 0)

(declare-fun index_1qtint (index_1) Int)

;; index_1'axiom
  (assert
  (forall ((i index_1))
  (and (<= 1 (index_1qtint i)) (<= (index_1qtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_1 index_1) Bool)

(declare-const dummy4 index_1)

(declare-datatypes ((index_1__ref 0))
(((index_1__refqtmk (index_1__content index_1)))))
(define-fun index_1__ref_index_1__content__4__projection ((a index_1__ref)) index_1 
  (index_1__content a))

(define-fun dynamic_invariant1 ((temp___expr_835 Int)
  (temp___is_init_831 Bool) (temp___skip_constant_832 Bool)
  (temp___do_toplevel_833 Bool)
  (temp___do_typ_inv_834 Bool)) Bool (=>
                                     (or (= temp___is_init_831 true)
                                     (<= 1 100)) (in_range5 temp___expr_835)))

(declare-sort index_2 0)

(declare-fun index_2qtint (index_2) Int)

;; index_2'axiom
  (assert
  (forall ((i index_2))
  (and (<= 1 (index_2qtint i)) (<= (index_2qtint i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (index_2 index_2) Bool)

(declare-const dummy5 index_2)

(declare-datatypes ((index_2__ref 0))
(((index_2__refqtmk (index_2__content index_2)))))
(define-fun index_2__ref_index_2__content__4__projection ((a index_2__ref)) index_2 
  (index_2__content a))

(define-fun dynamic_invariant2 ((temp___expr_842 Int)
  (temp___is_init_838 Bool) (temp___skip_constant_839 Bool)
  (temp___do_toplevel_840 Bool)
  (temp___do_typ_inv_841 Bool)) Bool (=>
                                     (or (= temp___is_init_838 true)
                                     (<= 1 100)) (in_range6 temp___expr_842)))

(define-fun dynamic_invariant3 ((temp___expr_856 us_t)
  (temp___is_init_852 Bool) (temp___skip_constant_853 Bool)
  (temp___do_toplevel_854 Bool)
  (temp___do_typ_inv_855 Bool)) Bool (=>
                                     (not (= temp___skip_constant_853 true))
                                     (dynamic_property2 1 100
                                     (first2 temp___expr_856)
                                     (last2 temp___expr_856) 1 100
                                     (first_2 temp___expr_856)
                                     (last_2 temp___expr_856))))

;; in_range__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i Int) (j Int))
  (! (=>
     (and
     (and
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant x
     true true true true)) (dynamic_invariant1 i true true true true))
     (dynamic_invariant2 j true true true true))
     (and (and (<= (first2 a) i) (<= i (last2 a)))
     (and (<= (first_2 a) j) (<= j (last_2 a)))))
     (let ((result (in_range3 a x i j)))
     (=> (in_range__function_guard result a x i j)
     (=> (= result true) (< x 2147483647))))) :pattern ((in_range3 a x i j)) ))))

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i Int) (j Int))
  (! (= (= (in_range3 a x i j) true)
     (<= x (+ (* (- i (first2 a)) (length_2 a)) (- j (first_2 a))))) :pattern (
  (in_range3 a x i j)) ))))

(declare-fun choose (Int) Bool)

(declare-fun choose__function_guard (Bool Int) Bool)

;; temp___result_186'def
  (assert (forall ((e Int)) (choose__function_guard (choose e) e)))

(define-fun add_one ((e Int)
  (x Int)) Int (ite (= (choose e) true) (+ x 1) x))

(declare-fun add_one__function_guard (Int Int Int) Bool)

(declare-fun result_in_range (us_t Int) Bool)

(declare-fun result_in_range__function_guard (Bool us_t Int) Bool)

;; result_in_range__post_axiom
  (assert true)

;; result_in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int))
  (! (= (= (result_in_range a x) true) (<= x (* (length a) (length_2 a)))) :pattern (
  (result_in_range a x)) ))))

(declare-datatypes ((array_type__ref1 0))
(((array_type__refqtmk1 (array_type__content1 us_t)))))
(define-fun array_type__ref_array_type__content__9__projection ((a array_type__ref1)) us_t 
  (array_type__content1 a))

(declare-sort index_11 0)

(declare-fun index_1qtint1 (index_11) Int)

;; index_1'axiom
  (assert
  (forall ((i index_11))
  (and (<= 1 (index_1qtint1 i)) (<= (index_1qtint1 i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (index_11 index_11) Bool)

(declare-const dummy6 index_11)

(declare-datatypes ((index_1__ref1 0))
(((index_1__refqtmk1 (index_1__content1 index_11)))))
(define-fun index_1__ref_index_1__content__6__projection ((a index_1__ref1)) index_11 
  (index_1__content1 a))

(declare-sort index_21 0)

(declare-fun index_2qtint1 (index_21) Int)

;; index_2'axiom
  (assert
  (forall ((i index_21))
  (and (<= 1 (index_2qtint1 i)) (<= (index_2qtint1 i) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (index_21 index_21) Bool)

(declare-const dummy7 index_21)

(declare-datatypes ((index_2__ref1 0))
(((index_2__refqtmk1 (index_2__content1 index_21)))))
(define-fun index_2__ref_index_2__content__6__projection ((a index_2__ref1)) index_21 
  (index_2__content1 a))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= 0 (element_outqtint i)) (<= (element_outqtint i) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (element_out element_out) Bool)

(declare-const dummy8 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__7__projection ((a element_out__ref)) element_out 
  (element_out__content a))

(define-fun to_rep1 ((x element_out)) Int (element_outqtint x))

(declare-fun of_rep1 (Int) element_out)

;; inversion_axiom
  (assert
  (forall ((x element_out))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_out)) (! (in_range9
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range9 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort map2 0)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 map2)))))
(declare-fun get1 (map2 Int Int) element_out)

(declare-fun set1 (map2 Int Int element_out) map2)

;; Select_eq
  (assert
  (forall ((m map2))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a element_out))
  (! (= (get1 (set1 m i j a) i j) a) :pattern ((set1 m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map2))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a element_out))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get1 (set1 m i j a) i2 j2) (get1 m i2 j2))) :pattern ((get1
                                                               (set1 m i j a)
                                                               i2 j2)) :pattern (
  (set1 m i j a) (get1 m i2 j2)) ))))))

(declare-fun slide1 (map2 Int Int Int Int) map2)

;; slide_def
  (assert
  (forall ((a map2))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get1 (slide1 a old_first new_first old_first_2 new_first_2) i j) 
  (get1 a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get1 (slide1 a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq2 ((a map2) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map2) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_188 Int)
                             (temp___idx_189 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_188)
                             (<= temp___idx_188 a__last))
                             (and (<= a__first_2 temp___idx_189)
                             (<= temp___idx_189 a__last_2)))
                             (= (to_rep1
                                (get1 a temp___idx_188 temp___idx_189)) 
                             (to_rep1
                             (get1 b (+ (- b__first a__first) temp___idx_188)
                             (+ (- b__first_2 a__first_2) temp___idx_189)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map2) (b map2))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq2 b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_188 Int) (temp___idx_189 Int))
  (=>
  (and (and (<= a__first temp___idx_188) (<= temp___idx_188 a__last))
  (and (<= a__first_2 temp___idx_189) (<= temp___idx_189 a__last_2)))
  (= (to_rep1 (get1 a temp___idx_188 temp___idx_189)) (to_rep1
                                                      (get1 b
                                                      (+ (- b__first a__first) temp___idx_188)
                                                      (+ (- b__first_2 a__first_2) temp___idx_189)))))))))))

(declare-sort t2 0)

(declare-fun first3 (t2) integer)

(declare-fun last3 (t2) integer)

(declare-fun mk2 (Int Int) t2)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first3 (mk2 f l))) f) (= (to_rep (last3 (mk2 f l))) l)))) :pattern (
  (mk2 f l)) )))

(define-fun dynamic_property3 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range7 low) (in_range7 high))))))

(declare-sort t3 0)

(declare-fun first4 (t3) integer)

(declare-fun last4 (t3) integer)

(declare-fun mk3 (Int Int) t3)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first4 (mk3 f l))) f) (= (to_rep (last4 (mk3 f l))) l)))) :pattern (
  (mk3 f l)) )))

(define-fun dynamic_property4 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range8 low) (in_range8 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 map2)(rt1 t2)(rt_21 t3)))))
(define-fun to_array1 ((a us_t1)) map2 (elts1 a))

(define-fun of_array1 ((a map2) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t1 (us_tqtmk1 a (mk2 f l) (mk3 f2 l2)))

(define-fun first5 ((a us_t1)) Int (to_rep (first3 (rt1 a))))

(define-fun last5 ((a us_t1)) Int (to_rep (last3 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first5 a) (last5 a))
                                    (+ (- (last5 a) (first5 a)) 1) 0))

(define-fun first_21 ((a us_t1)) Int (to_rep (first4 (rt_21 a))))

(define-fun last_21 ((a us_t1)) Int (to_rep (last4 (rt_21 a))))

(define-fun length_21 ((a us_t1)) Int (ite (<= (first_21 a) (last_21 a))
                                      (+ (- (last_21 a) (first_21 a)) 1) 0))

(define-fun dynamic_property5 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property3 range_first1 range_last1 f1 l1)
                 (dynamic_property4 range_first2 range_last2 f2 l2)))

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
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first3 (rt1 x)))
                  (to_rep (last3 (rt1 x))) (to_rep (first4 (rt_21 x)))
                  (to_rep (last4 (rt_21 x))) (elts1 y)
                  (to_rep (first3 (rt1 y))) (to_rep (last3 (rt1 y)))
                  (to_rep (first4 (rt_21 y))) (to_rep (last4 (rt_21 y)))))

(declare-fun user_eq9 (us_t1 us_t1) Bool)

(declare-const dummy9 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__3__projection ((a acc_array__ref)) us_t1 
  (acc_array__content a))

(declare-fun fold (us_t Int) us_t1)

(declare-fun fold__function_guard (us_t1 us_t Int) Bool)

(define-fun dynamic_invariant4 ((temp___expr_937 Int)
  (temp___is_init_933 Bool) (temp___skip_constant_934 Bool)
  (temp___do_toplevel_935 Bool)
  (temp___do_typ_inv_936 Bool)) Bool (=>
                                     (or (= temp___is_init_933 true)
                                     (<= 0 2147483647)) (in_range9
                                     temp___expr_937)))

(define-fun dynamic_invariant5 ((temp___expr_956 us_t1)
  (temp___is_init_952 Bool) (temp___skip_constant_953 Bool)
  (temp___do_toplevel_954 Bool)
  (temp___do_typ_inv_955 Bool)) Bool (=>
                                     (not (= temp___skip_constant_953 true))
                                     (dynamic_property5 1 100
                                     (first5 temp___expr_956)
                                     (last5 temp___expr_956) 1 100
                                     (first_21 temp___expr_956)
                                     (last_21 temp___expr_956))))

(define-fun dynamic_invariant6 ((temp___expr_930 us_t)
  (temp___is_init_926 Bool) (temp___skip_constant_927 Bool)
  (temp___do_toplevel_928 Bool)
  (temp___do_typ_inv_929 Bool)) Bool (=>
                                     (not (= temp___skip_constant_927 true))
                                     (dynamic_property2 1 100
                                     (first2 temp___expr_930)
                                     (last2 temp___expr_930) 1 100
                                     (first_2 temp___expr_930)
                                     (last_2 temp___expr_930))))

;; fold__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((init Int))
  (! (and
     (forall ((a1 us_t) (init1 Int)) (in_range__function_guard
     (in_range3
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     init1 (first2 a1) (first_2 a1))
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     init1 (first2 a1) (first_2 a1)))
     (=>
     (and
     (and (dynamic_invariant6 a true true true true) (dynamic_invariant4 init
     true true true true))
     (and (and (< 0 (length a)) (< 0 (length_2 a)))
     (= (in_range3
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a))
        init (first2 a) (first_2 a)) true)))
     (let ((result (fold a init)))
     (and
     (forall ((a1 us_t) (init1 Int)) (in_range__function_guard
     (in_range3
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     init1 (first2 a1) (first_2 a1))
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     init1 (first2 a1) (first_2 a1)))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int)) (in_range__function_guard
     (in_range3
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) (- i 1) (last_2 a1))) i (first_2 a1))
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) (- i 1) (last_2 a1))) i
     (first_2 a1)))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int) (j Int))
     (in_range__function_guard
     (in_range3
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) i (- j 1))) i j)
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) i (- j 1))) i j))
     (and
     (forall ((a1 us_t) (result1 us_t1)) (result_in_range__function_guard
     (result_in_range
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) (last2 a1) (last_2 a1))))
     (of_array (to_array a1) (first2 a1) (last2 a1) (first_2 a1) (last_2 a1))
     (to_rep1 (get1 (to_array1 result1) (last2 a1) (last_2 a1)))))
     (=> (fold__function_guard result a init)
     (and
     (and
     (and
     (and
     (and
     (and
     (and
     (and (and (= (first5 result) (first2 a)) (= (last5 result) (last2 a)))
     (= (first_21 result) (first_2 a))) (= (last_21 result) (last_2 a)))
     (= (in_range3
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a))
        init (first2 a) (first_2 a)) true))
     (= (to_rep1 (get1 (to_array1 result) (first2 a) (first_2 a))) (add_one
                                                                   (to_rep
                                                                   (get
                                                                   (to_array
                                                                   a)
                                                                   (first2 a)
                                                                   (first_2
                                                                   a))) init)))
     (forall ((i Int))
     (=> (and (<= (first2 a) i) (<= i (last2 a)))
     (=> (< (first2 a) i)
     (and
     (= (in_range3
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a))
        (to_rep1 (get1 (to_array1 result) (- i 1) (last_2 a))) i (first_2 a)) true)
     (= (to_rep1 (get1 (to_array1 result) i (first_2 a))) (add_one
                                                          (to_rep
                                                          (get (to_array a) i
                                                          (first_2 a)))
                                                          (to_rep1
                                                          (get1
                                                          (to_array1 result)
                                                          (- i 1) (last_2 a))))))))))
     (forall ((i Int))
     (=> (and (<= (first2 a) i) (<= i (last2 a)))
     (forall ((j Int))
     (=> (and (<= (first_2 a) j) (<= j (last_2 a)))
     (=> (< (first_2 a) j)
     (and
     (= (in_range3
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a))
        (to_rep1 (get1 (to_array1 result) i (- j 1))) i j) true)
     (= (to_rep1 (get1 (to_array1 result) i j)) (add_one
                                                (to_rep
                                                (get (to_array a) i j))
                                                (to_rep1
                                                (get1 (to_array1 result) i
                                                (- j 1))))))))))))
     (= (result_in_range
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a))
        (to_rep1 (get1 (to_array1 result) (last2 a) (last_2 a)))) true))
     (dynamic_invariant5 result true false true true)))))))))) :pattern (
  (fold a init)) ))))

(declare-datatypes ((array_type__ref2 0))
(((array_type__refqtmk2 (array_type__content2 us_t)))))
(define-fun array_type__ref_array_type__content__8__projection ((a array_type__ref2)) us_t 
  (array_type__content2 a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const init Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort element_out1 0)

(declare-fun element_outqtint1 (element_out1) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out1))
  (and (<= 0 (element_outqtint1 i)) (<= (element_outqtint1 i) 2147483647))))

(define-fun in_range10 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq10 (element_out1 element_out1) Bool)

(declare-const dummy10 element_out1)

(declare-datatypes ((element_out__ref1 0))
(((element_out__refqtmk1 (element_out__content1 element_out1)))))
(define-fun element_out__ref_element_out__content__6__projection ((a1 element_out__ref1)) element_out1 
  (element_out__content1 a1))

(define-fun dynamic_invariant7 ((temp___expr_902 Int)
  (temp___is_init_898 Bool) (temp___skip_constant_899 Bool)
  (temp___do_toplevel_900 Bool)
  (temp___do_typ_inv_901 Bool)) Bool (=>
                                     (or (= temp___is_init_898 true)
                                     (<= 0 2147483647)) (in_range10
                                     temp___expr_902)))

(define-fun dynamic_property6 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq11 (integer integer) Bool)

(declare-const dummy11 integer)

(declare-datatypes ((t282s__ref 0))
(((t282s__refqtmk (t282s__content integer)))))
(define-fun t282s__ref_t282s__content__projection ((a1 t282s__ref)) integer 
  (t282s__content a1))

(define-fun dynamic_property7 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq12 (integer integer) Bool)

(declare-const dummy12 integer)

(declare-datatypes ((t283s__ref 0))
(((t283s__refqtmk (t283s__content integer)))))
(define-fun t283s__ref_t283s__content__projection ((a1 t283s__ref)) integer 
  (t283s__content a1))

(define-fun dynamic_invariant8 ((temp___expr_895 us_t)
  (temp___is_init_891 Bool) (temp___skip_constant_892 Bool)
  (temp___do_toplevel_893 Bool)
  (temp___do_typ_inv_894 Bool)) Bool (=>
                                     (not (= temp___skip_constant_892 true))
                                     (dynamic_property2 1 100
                                     (first2 temp___expr_895)
                                     (last2 temp___expr_895) 1 100
                                     (first_2 temp___expr_895)
                                     (last_2 temp___expr_895))))

(define-fun dynamic_invariant9 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; choose__post_axiom
  (assert true)

(define-fun dynamic_invariant10 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range2 temp___expr_210)))

(define-fun dynamic_invariant11 ((temp___expr_909 Int)
  (temp___is_init_905 Bool) (temp___skip_constant_906 Bool)
  (temp___do_toplevel_907 Bool)
  (temp___do_typ_inv_908 Bool)) Bool (=>
                                     (or (= temp___is_init_905 true)
                                     (<= 1 100)) (in_range7 temp___expr_909)))

(define-fun dynamic_invariant12 ((temp___expr_916 Int)
  (temp___is_init_912 Bool) (temp___skip_constant_913 Bool)
  (temp___do_toplevel_914 Bool)
  (temp___do_typ_inv_915 Bool)) Bool (=>
                                     (or (= temp___is_init_912 true)
                                     (<= 1 100)) (in_range8 temp___expr_916)))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 545, characters 0-0
  (not
  (forall ((r Int) (spark__branch Bool))
  (=> (dynamic_invariant8 a true false true true)
  (=> (dynamic_invariant7 init true false true true)
  (=> (in_range__function_guard
  (in_range3
  (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a)) 
  init (first2 a) (first_2 a))
  (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a)) 
  init (first2 a) (first_2 a))
  (=>
  (or (or (= (length a) 0) (= (length_2 a) 0))
  (= (in_range3
     (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a)) 
     init (first2 a) (first_2 a)) true))
  (=> (= r init)
  (=> (dynamic_invariant7 r true false true true)
  (=> (= spark__branch (ite (< 0 (length_2 a)) true false))
  (=> (= spark__branch true)
  (let ((temp___1778 (first2 a)))
  (forall ((i Int))
  (=> (= i temp___1778)
  (=>
  (= (and (ite (<= temp___1778 i) true false) (ite (<= i (last2 a)) true
                                              false)) true)
  (let ((o (first_2 a)))
  (=> (in_range6 o)
  (=> (in_range5 i)
  (=> (dynamic_property2 1 100 (first2 a) (last2 a) 1 100 (first_2 a)
  (last_2 a))
  (<= o (last_2
        (of_array (to_array a) (first2 a) (last2 a) (first_2 a) (last_2 a)))))))))))))))))))))))
(check-sat)
(exit)
