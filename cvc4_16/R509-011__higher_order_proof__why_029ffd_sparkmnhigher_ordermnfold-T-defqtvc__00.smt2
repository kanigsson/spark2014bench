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

(declare-const first Int)

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((my_index__ref 0))
(((my_index__refqtmk (my_index__content integer)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) integer 
  (my_index__content a))

(declare-const first1 Int)

(declare-const last1 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((my_index_2__ref 0))
(((my_index_2__refqtmk (my_index_2__content integer)))))
(define-fun my_index_2__ref_my_index_2__content__projection ((a my_index_2__ref)) integer 
  (my_index_2__content a))

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
                             (forall ((temp___idx_159 Int)
                             (temp___idx_160 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_159)
                             (<= temp___idx_159 a__last))
                             (and (<= a__first_2 temp___idx_160)
                             (<= temp___idx_160 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_159 temp___idx_160)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_159)
                             (+ (- b__first_2 a__first_2) temp___idx_160)))))))
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
  (forall ((temp___idx_159 Int) (temp___idx_160 Int))
  (=>
  (and (and (<= a__first temp___idx_159) (<= temp___idx_159 a__last))
  (and (<= a__first_2 temp___idx_160) (<= temp___idx_160 a__last_2)))
  (= (to_rep (get a temp___idx_159 temp___idx_160)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_159)
                                                    (+ (- b__first_2 a__first_2) temp___idx_160)))))))))))

(declare-sort t 0)

(declare-fun first2 (t) integer)

(declare-fun last2 (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first2 (mk f l))) f) (= (to_rep (last2 (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property2 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-sort t1 0)

(declare-fun first3 (t1) integer)

(declare-fun last3 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first3 (mk1 f l))) f) (= (to_rep (last3 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property3 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property1 range_first range_last low)
                   (dynamic_property1 range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))
(define-fun to_array ((a us_t)) map1 (elts a))

(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t (us_tqtmk a (mk f l) (mk1 f2 l2)))

(define-fun first4 ((a us_t)) Int (to_rep (first2 (rt a))))

(define-fun last4 ((a us_t)) Int (to_rep (last2 (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first4 a) (last4 a))
                                  (+ (- (last4 a) (first4 a)) 1) 0))

(define-fun first_2 ((a us_t)) Int (to_rep (first3 (rt_2 a))))

(define-fun last_2 ((a us_t)) Int (to_rep (last3 (rt_2 a))))

(define-fun length_2 ((a us_t)) Int (ite (<= (first_2 a) (last_2 a))
                                    (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property4 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property2 range_first1 range_last1 f1 l1)
                 (dynamic_property3 range_first2 range_last2 f2 l2)))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first2 (rt x)))
                 (to_rep (last2 (rt x))) (to_rep (first3 (rt_2 x)))
                 (to_rep (last3 (rt_2 x))) (elts y) (to_rep (first2 (rt y)))
                 (to_rep (last2 (rt y))) (to_rep (first3 (rt_2 y)))
                 (to_rep (last3 (rt_2 y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((my_matrix__ref 0))
(((my_matrix__refqtmk (my_matrix__content us_t)))))
(define-fun my_matrix__ref_my_matrix__content__projection ((a my_matrix__ref)) us_t 
  (my_matrix__content a))

(declare-fun ind_prop (us_t Int Int Int) Bool)

(declare-fun ind_prop__function_guard (Bool us_t Int Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_172)))

;; first__def_axiom
  (assert (= first fst))

;; last__def_axiom
  (assert (= last lst))

(declare-const fst2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const lst2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant2 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= first1 last1)) (dynamic_property1
                                     first1 last1 temp___expr_179)))

;; first__def_axiom
  (assert (= first1 fst2))

;; last__def_axiom
  (assert (= last1 lst2))

(define-fun dynamic_invariant3 ((temp___expr_186 us_t)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (not (= temp___skip_constant_183 true))
                                     (dynamic_property4 first last
                                     (first4 temp___expr_186)
                                     (last4 temp___expr_186) first1 last1
                                     (first_2 temp___expr_186)
                                     (last_2 temp___expr_186))))

;; ind_prop__post_axiom
  (assert true)

(declare-fun final_prop (us_t Int) Bool)

(declare-fun final_prop__function_guard (Bool us_t Int) Bool)

;; final_prop__post_axiom
  (assert true)

(declare-fun f_2 (Int Int) Int)

(declare-fun f_2__function_guard (Int Int Int) Bool)

;; f_2__post_axiom
  (assert
  (forall ((x Int) (i Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant i true
     true true true))
     (let ((result (f_2 x i)))
     (=> (f_2__function_guard result x i) (dynamic_invariant result true
     false true true)))) :pattern ((f_2 x i)) )))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__2__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const init Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const first5 Int)

(declare-const last5 Int)

(define-fun dynamic_property5 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((index_1__ref 0))
(((index_1__refqtmk (index_1__content integer)))))
(define-fun index_1__ref_index_1__content__2__projection ((a1 index_1__ref)) integer 
  (index_1__content a1))

(declare-const first6 Int)

(declare-const last6 Int)

(define-fun dynamic_property6 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((index_2__ref 0))
(((index_2__refqtmk (index_2__content integer)))))
(define-fun index_2__ref_index_2__content__2__projection ((a1 index_2__ref)) integer 
  (index_2__content a1))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= (- 2147483648) (element_outqtint i))
  (<= (element_outqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (element_out element_out) Bool)

(declare-const dummy6 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__2__projection ((a1 element_out__ref)) element_out 
  (element_out__content a1))

(define-fun to_rep1 ((x element_out)) Int (element_outqtint x))

(declare-fun of_rep1 (Int) element_out)

;; inversion_axiom
  (assert
  (forall ((x element_out))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_out)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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
  (forall ((a1 element_out))
  (! (= (get1 (set1 m i j a1) i j) a1) :pattern ((set1 m i j a1)) ))))))

;; Select_neq
  (assert
  (forall ((m map2))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a1 element_out))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get1 (set1 m i j a1) i2 j2) (get1 m i2 j2))) :pattern ((get1
                                                                (set1 m i j
                                                                a1) i2 j2)) :pattern (
  (set1 m i j a1) (get1 m i2 j2)) ))))))

(declare-fun slide1 (map2 Int Int Int Int) map2)

;; slide_def
  (assert
  (forall ((a1 map2))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get1 (slide1 a1 old_first new_first old_first_2 new_first_2) i j) 
  (get1 a1 (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get1 (slide1 a1 old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq2 ((a1 map2) (a__first Int) (a__last Int) (a__first_2 Int)
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
                             (forall ((temp___idx_164 Int)
                             (temp___idx_165 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_164)
                             (<= temp___idx_164 a__last))
                             (and (<= a__first_2 temp___idx_165)
                             (<= temp___idx_165 a__last_2)))
                             (= (to_rep1
                                (get1 a1 temp___idx_164 temp___idx_165)) 
                             (to_rep1
                             (get1 b (+ (- b__first a__first) temp___idx_164)
                             (+ (- b__first_2 a__first_2) temp___idx_165)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a1 map2) (b map2))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq2 b b__first b__last b__first_2 b__last_2 a1 a__first a__last
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
  (forall ((temp___idx_164 Int) (temp___idx_165 Int))
  (=>
  (and (and (<= a__first temp___idx_164) (<= temp___idx_164 a__last))
  (and (<= a__first_2 temp___idx_165) (<= temp___idx_165 a__last_2)))
  (= (to_rep1 (get1 a1 temp___idx_164 temp___idx_165)) (to_rep1
                                                       (get1 b
                                                       (+ (- b__first a__first) temp___idx_164)
                                                       (+ (- b__first_2 a__first_2) temp___idx_165)))))))))))

(declare-sort t2 0)

(declare-fun first7 (t2) integer)

(declare-fun last7 (t2) integer)

(declare-fun mk2 (Int Int) t2)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first7 (mk2 f l))) f) (= (to_rep (last7 (mk2 f l))) l)))) :pattern (
  (mk2 f l)) )))

(define-fun dynamic_property7 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property5 range_first range_last low)
                   (dynamic_property5 range_first range_last high))))))

(declare-sort t3 0)

(declare-fun first8 (t3) integer)

(declare-fun last8 (t3) integer)

(declare-fun mk3 (Int Int) t3)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first8 (mk3 f l))) f) (= (to_rep (last8 (mk3 f l))) l)))) :pattern (
  (mk3 f l)) )))

(define-fun dynamic_property8 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property6 range_first range_last low)
                   (dynamic_property6 range_first range_last high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 map2)(rt1 t2)(rt_21 t3)))))
(define-fun to_array1 ((a1 us_t1)) map2 (elts1 a1))

(define-fun of_array1 ((a1 map2) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t1 (us_tqtmk1 a1 (mk2 f l) (mk3 f2 l2)))

(define-fun first9 ((a1 us_t1)) Int (to_rep (first7 (rt1 a1))))

(define-fun last9 ((a1 us_t1)) Int (to_rep (last7 (rt1 a1))))

(define-fun length1 ((a1 us_t1)) Int (ite (<= (first9 a1) (last9 a1))
                                     (+ (- (last9 a1) (first9 a1)) 1) 0))

(define-fun first_21 ((a1 us_t1)) Int (to_rep (first8 (rt_21 a1))))

(define-fun last_21 ((a1 us_t1)) Int (to_rep (last8 (rt_21 a1))))

(define-fun length_21 ((a1 us_t1)) Int (ite (<= (first_21 a1) (last_21 a1))
                                       (+ (- (last_21 a1) (first_21 a1)) 1)
                                       0))

(define-fun dynamic_property9 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property7 range_first1 range_last1 f1 l1)
                 (dynamic_property8 range_first2 range_last2 f2 l2)))

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
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first7 (rt1 x)))
                  (to_rep (last7 (rt1 x))) (to_rep (first8 (rt_21 x)))
                  (to_rep (last8 (rt_21 x))) (elts1 y)
                  (to_rep (first7 (rt1 y))) (to_rep (last7 (rt1 y)))
                  (to_rep (first8 (rt_21 y))) (to_rep (last8 (rt_21 y)))))

(declare-fun user_eq7 (us_t1 us_t1) Bool)

(declare-const dummy7 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__projection ((a1 acc_array__ref)) us_t1 
  (acc_array__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const r__first_2 integer)

(declare-const r__last_2 integer)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(define-fun dynamic_invariant4 ((temp___expr_264 Int)
  (temp___is_init_260 Bool) (temp___skip_constant_261 Bool)
  (temp___do_toplevel_262 Bool)
  (temp___do_typ_inv_263 Bool)) Bool (=>
                                     (or (= temp___is_init_260 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_264)))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t1)))))
(define-fun trS__ref_trS__content__projection ((a1 trS__ref)) us_t1 (trS__content
                                                                    a1))

(declare-datatypes ((t27s__ref 0))
(((t27s__refqtmk (t27s__content us_t1)))))
(define-fun t27s__ref_t27s__content__projection ((a1 t27s__ref)) us_t1 
  (t27s__content a1))

(define-fun dynamic_property10 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t28s__ref 0))
(((t28s__refqtmk (t28s__content integer)))))
(define-fun t28s__ref_t28s__content__projection ((a1 t28s__ref)) integer 
  (t28s__content a1))

(define-fun dynamic_property11 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq9 (integer integer) Bool)

(declare-const dummy9 integer)

(declare-datatypes ((t41s__ref 0))
(((t41s__refqtmk (t41s__content integer)))))
(define-fun t41s__ref_t41s__content__projection ((a1 t41s__ref)) integer 
  (t41s__content a1))

(define-fun dynamic_invariant5 ((temp___expr_257 us_t)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (not (= temp___skip_constant_254 true))
                                     (dynamic_property4 first last
                                     (first4 temp___expr_257)
                                     (last4 temp___expr_257) first1 last1
                                     (first_2 temp___expr_257)
                                     (last_2 temp___expr_257))))

(declare-fun test_higher_order1__my_fold_2__acc__fold__R24s__r__aggregate_def (Int
  Int Int Int Int) us_t1)

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; fst__def_axiom
  (assert (and (id__function_guard (id 0) 0) (= fst (id 0))))

;; lst__def_axiom
  (assert (and (id__function_guard (id 100) 100) (= lst (id 100))))

;; fst2__def_axiom
  (assert (and (id__function_guard (id 1) 1) (= fst2 (id 1))))

;; lst2__def_axiom
  (assert (and (id__function_guard (id 200) 200) (= lst2 (id 200))))

(define-fun dynamic_invariant6 ((temp___expr_286 us_t1)
  (temp___is_init_282 Bool) (temp___skip_constant_283 Bool)
  (temp___do_toplevel_284 Bool)
  (temp___do_typ_inv_285 Bool)) Bool (=>
                                     (not (= temp___skip_constant_283 true))
                                     (dynamic_property9 first5 last5
                                     (first9 temp___expr_286)
                                     (last9 temp___expr_286) first6 last6
                                     (first_21 temp___expr_286)
                                     (last_21 temp___expr_286))))

(define-fun dynamic_invariant7 ((temp___expr_236 Int)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (or (= temp___is_init_232 true)
                                     (<= first5 last5)) (dynamic_property5
                                     first5 last5 temp___expr_236)))

;; first__def_axiom
  (assert (= first5 fst))

;; last__def_axiom
  (assert (= last5 lst))

(define-fun dynamic_invariant8 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= first6 last6)) (dynamic_property6
                                     first6 last6 temp___expr_243)))

;; first__def_axiom
  (assert (= first6 fst2))

;; last__def_axiom
  (assert (= last6 lst2))

;; def_axiom
  (assert
  (forall ((temp___426 Int) (temp___427 Int) (temp___428 Int)
  (temp___429 Int) (temp___430 Int))
  (let ((temp___425 (test_higher_order1__my_fold_2__acc__fold__R24s__r__aggregate_def
                    temp___426 temp___427 temp___428 temp___429 temp___430)))
  (=> (dynamic_invariant4 temp___426 true true true true)
  (and
  (=> (dynamic_property9 first5 last5 temp___427 temp___428 first6 last6
  temp___429 temp___430)
  (and
  (and (= (first_21 temp___425) temp___429)
  (= (last_21 temp___425) temp___430))
  (and (= (first9 temp___425) temp___427) (= (last9 temp___425) temp___428))))
  (forall ((temp___431 Int) (temp___432 Int))
  (= (to_rep1 (get1 (to_array1 temp___425) temp___431 temp___432)) temp___426)))))))

(define-fun dynamic_invariant9 ((temp___expr_329 us_t1)
  (temp___is_init_325 Bool) (temp___skip_constant_326 Bool)
  (temp___do_toplevel_327 Bool)
  (temp___do_typ_inv_328 Bool)) Bool (=>
                                     (not (= temp___skip_constant_326 true))
                                     (and
                                     (and (dynamic_property9 (first4 a)
                                     (last4 a) (first9 temp___expr_329)
                                     (last9 temp___expr_329) (first_2 a)
                                     (last_2 a) (first_21 temp___expr_329)
                                     (last_21 temp___expr_329))
                                     (and
                                     (= (first9 temp___expr_329) (first4 a))
                                     (= (last9 temp___expr_329) (last4 a))))
                                     (and
                                     (= (first_21 temp___expr_329) (first_2
                                                                   a))
                                     (= (last_21 temp___expr_329) (last_2 a))))))

(define-fun default_initial_assumption ((temp___expr_332 us_t1)
  (temp___skip_top_level_333 Bool)) Bool (and
                                         (and
                                         (and
                                         (= (first9 temp___expr_332) 
                                         (first4 a))
                                         (= (last9 temp___expr_332) (last4 a)))
                                         (= (first_21 temp___expr_332) 
                                         (first_2 a)))
                                         (= (last_21 temp___expr_332) 
                                         (last_2 a))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 484, characters 0-0
  (not
  (forall ((acc Int))
  (=> (dynamic_invariant5 a true false true true)
  (=> (dynamic_invariant4 init true false true true)
  (=> (< 0 (length a))
  (=> (< 0 (length_2 a))
  (=> (ind_prop__function_guard
  (ind_prop
  (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a)) 
  init (first4 a) (first_2 a))
  (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a)) 
  init (first4 a) (first_2 a))
  (=>
  (= (ind_prop
     (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a)) 
     init (first4 a) (first_2 a)) true)
  (=> (= acc init)
  (=> (dynamic_invariant4 acc true false true true)
  (let ((temp___433 (test_higher_order1__my_fold_2__acc__fold__R24s__r__aggregate_def
                    init (first4 a) (last4 a) (first_2 a) (last_2 a))))
  (=> (= (first9 temp___433) (first4 a))
  (=> (= (last9 temp___433) (last4 a))
  (=>
  (and
  (ite (<= (first9 temp___433) (last9 temp___433))
  (and (<= (first4 a) (last4 a))
  (= (- (last9 temp___433) (first9 temp___433)) (- (last4 a) (first4 a))))
  (< (last4 a) (first4 a)))
  (ite (<= (first_21 temp___433) (last_21 temp___433))
  (and (<= (first_2 a) (last_2 a))
  (= (- (last_21 temp___433) (first_21 temp___433)) (- (last_2 a) (first_2 a))))
  (< (last_2 a) (first_2 a))))
  (let ((test_higher_order1__my_fold_2__acc__fold__R24s__r__assume (of_array1
                                                                   (slide1
                                                                   (to_array1
                                                                   temp___433)
                                                                   (first9
                                                                   temp___433)
                                                                   (first4 a)
                                                                   (first_21
                                                                   temp___433)
                                                                   (first_2
                                                                   a))
                                                                   (first4 a)
                                                                   (last4 a)
                                                                   (first_2
                                                                   a)
                                                                   (last_2 a))))
  (forall ((r map2))
  (=>
  (= r (to_array1 test_higher_order1__my_fold_2__acc__fold__R24s__r__assume))
  (=>
  (= (to_rep r__first) (first9
                       test_higher_order1__my_fold_2__acc__fold__R24s__r__assume))
  (=>
  (= (to_rep r__last) (last9
                      test_higher_order1__my_fold_2__acc__fold__R24s__r__assume))
  (=>
  (= (to_rep r__first_2) (first_21
                         test_higher_order1__my_fold_2__acc__fold__R24s__r__assume))
  (=>
  (= (to_rep r__last_2) (last_21
                        test_higher_order1__my_fold_2__acc__fold__R24s__r__assume))
  (=>
  (and
  (and (dynamic_property9 (first4 a) (last4 a) (to_rep r__first)
  (to_rep r__last) (first_2 a) (last_2 a) (to_rep r__first_2)
  (to_rep r__last_2))
  (and (= (to_rep r__first) (first4 a)) (= (to_rep r__last) (last4 a))))
  (and (= (to_rep r__first_2) (first_2 a)) (= (to_rep r__last_2) (last_2 a))))
  (let ((temp___437 (first4 a)))
  (forall ((i Int))
  (=> (= i temp___437)
  (=>
  (= (and (ite (<= temp___437 i) true false) (ite (<= i (last4 a)) true
                                             false)) true)
  (=>
  (or (= i (first4 a))
  (let ((temp___526 (last_2 a)))
  (and
  (and (<= (to_rep r__first_2) temp___526)
  (<= temp___526 (to_rep r__last_2)))
  (let ((o (- i 1)))
  (and (in_range1 o)
  (and (and (<= (to_rep r__first) o) (<= o (to_rep r__last)))
  (exists ((o1 Int)) (= (to_rep1 (get1 r o temp___526)) o1))))))))
  (let ((temp___522 (first_2 a)))
  (=> (dynamic_property1 first1 last1 temp___522)
  (=> (dynamic_property first last i)
  (let ((o (of_array (to_array a) (first4 a) (last4 a) (first_2 a)
           (last_2 a))))
  (=> (ind_prop__function_guard (ind_prop o acc i temp___522) o acc i
  temp___522)
  (=>
  (or (not (< (first4 a) i))
  (let ((temp___514 (first_2 a)))
  (and (dynamic_property1 first1 last1 temp___514)
  (let ((temp___513 (first4 a)))
  (and (dynamic_property first last temp___513)
  (let ((o1 init))
  (let ((o2 (of_array (to_array a) (first4 a) (last4 a) (first_2 a)
            (last_2 a))))
  (let ((o3 (ind_prop o2 o1 temp___513 temp___514)))
  (and (ind_prop__function_guard o3 o2 o1 temp___513 temp___514)
  (or (not (= o3 true))
  (let ((o4 init))
  (let ((temp___518 (first_2 a)))
  (and (and (<= (first_2 a) temp___518) (<= temp___518 (last_2 a)))
  (let ((temp___517 (first4 a)))
  (and (and (<= (first4 a) temp___517) (<= temp___517 (last4 a)))
  (exists ((o5 Int))
  (and (= (to_rep (get (to_array a) temp___517 temp___518)) o5)
  (let ((o6 (f_2 o5 o4)))
  (and
  (and (f_2__function_guard o6 o5 o4) (dynamic_invariant o6 true false true
  true))
  (let ((temp___516 (first_2 a)))
  (and
  (and (<= (to_rep r__first_2) temp___516)
  (<= temp___516 (to_rep r__last_2)))
  (let ((temp___515 (first4 a)))
  (and
  (and (<= (to_rep r__first) temp___515) (<= temp___515 (to_rep r__last)))
  (exists ((o7 Int)) (= (to_rep1 (get1 r temp___515 temp___516)) o7)))))))))))))))))))))))))
  (forall ((usf Int))
  (=>
  (= (and (ite (<= (first4 a) usf) true false) (ite (<= usf (last4 a)) true
                                               false)) true)
  (forall ((usf1 Int))
  (=>
  (= (and (ite (<= (first_2 a) usf1) true false) (ite (<= usf1 (last_2 a))
                                                 true false)) true)
  (forall ((o1 Bool))
  (=>
  (ite (< usf i) (= o1 (ite (< (first_2 a) usf1) true false)) (= o1 false))
  (=> (= o1 true)
  (=> (dynamic_property1 first1 last1 usf1)
  (=> (dynamic_property first last usf)
  (let ((o2 (- usf1 1)))
  (=> (in_range1 o2)
  (=> (and (<= (to_rep r__first_2) o2) (<= o2 (to_rep r__last_2)))
  (=> (and (<= (to_rep r__first) usf) (<= usf (to_rep r__last)))
  (forall ((o3 Int))
  (=> (= (to_rep1 (get1 r usf o2)) o3)
  (let ((o4 (of_array (to_array a) (first4 a) (last4 a) (first_2 a)
            (last_2 a))))
  (let ((o5 (ind_prop o4 o3 usf usf1)))
  (=> (ind_prop__function_guard o5 o4 o3 usf usf1)
  (=> (= o5 true)
  (let ((o6 (- usf1 1)))
  (=> (in_range1 o6)
  (=> (and (<= (to_rep r__first_2) o6) (<= o6 (to_rep r__last_2)))
  (=> (and (<= (to_rep r__first) usf) (<= usf (to_rep r__last)))
  (forall ((o7 Int))
  (=> (= (to_rep1 (get1 r usf o6)) o7)
  (=> (and (<= (first_2 a) usf1) (<= usf1 (last_2 a)))
  (=> (and (<= (first4 a) usf) (<= usf (last4 a)))
  (forall ((o8 Int))
  (=> (= (to_rep (get (to_array a) usf usf1)) o8)
  (let ((o9 (f_2 o8 o7)))
  (=>
  (and (f_2__function_guard o9 o8 o7) (dynamic_invariant o9 true false true
  true)) (<= (to_rep r__first_2) usf1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
