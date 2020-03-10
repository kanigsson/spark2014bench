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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const first5 Int)

(declare-const last5 Int)

(define-fun dynamic_property5 ((first_int Int) (last_int Int)
  (x1 Int)) Bool (and (<= first_int x1) (<= x1 last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((index_1__ref 0))
(((index_1__refqtmk (index_1__content integer)))))
(define-fun index_1__ref_index_1__content__2__projection ((a1 index_1__ref)) integer 
  (index_1__content a1))

(define-fun dynamic_invariant4 ((temp___expr_236 Int)
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

(declare-const first6 Int)

(declare-const last6 Int)

(define-fun dynamic_property6 ((first_int Int) (last_int Int)
  (x1 Int)) Bool (and (<= first_int x1) (<= x1 last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((index_2__ref 0))
(((index_2__refqtmk (index_2__content integer)))))
(define-fun index_2__ref_index_2__content__2__projection ((a1 index_2__ref)) integer 
  (index_2__content a1))

(define-fun dynamic_invariant5 ((temp___expr_243 Int)
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

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i1 element_out))
  (and (<= (- 2147483648) (element_outqtint i1))
  (<= (element_outqtint i1) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (element_out element_out) Bool)

(declare-const dummy6 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__2__projection ((a1 element_out__ref)) element_out 
  (element_out__content a1))

(define-fun dynamic_invariant6 ((temp___expr_264 Int)
  (temp___is_init_260 Bool) (temp___skip_constant_261 Bool)
  (temp___do_toplevel_262 Bool)
  (temp___do_typ_inv_263 Bool)) Bool (=>
                                     (or (= temp___is_init_260 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_264)))

(define-fun dynamic_invariant7 ((temp___expr_257 us_t)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (not (= temp___skip_constant_254 true))
                                     (dynamic_property4 first last
                                     (first4 temp___expr_257)
                                     (last4 temp___expr_257) first1 last1
                                     (first_2 temp___expr_257)
                                     (last_2 temp___expr_257))))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (dynamic_invariant x1 true true true true)
     (let ((result (id x1)))
     (=> (id__function_guard result x1) (dynamic_invariant result true false
     true true)))) :pattern ((id x1)) )))

;; fst__def_axiom
  (assert (and (id__function_guard (id 0) 0) (= fst (id 0))))

;; lst__def_axiom
  (assert (and (id__function_guard (id 100) 100) (= lst (id 100))))

;; fst2__def_axiom
  (assert (and (id__function_guard (id 1) 1) (= fst2 (id 1))))

;; lst2__def_axiom
  (assert (and (id__function_guard (id 200) 200) (= lst2 (id 200))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 456, characters 0-0
  (not
  (=> (dynamic_invariant7 a true false true true)
  (=> (dynamic_invariant6 x true false true true)
  (=> (dynamic_invariant4 i true false true true)
  (=> (dynamic_invariant5 j true false true true)
  (=> (<= (first4 a) i)
  (=> (<= i (last4 a))
  (=> (<= (first_2 a) j)
  (=> (<= j (last_2 a))
  (=> (not (= j (last_2 a)))
  (=> (ind_prop__function_guard
  (ind_prop
  (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a)) 
  x i j) (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a))
  x i j)
  (=>
  (= (ind_prop
     (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a)) 
     x i j) true)
  (let ((o (+ j 1)))
  (=> (in_range1 o)
  (=> (dynamic_property1 first1 last1 o)
  (let ((o1 x))
  (=> (and (<= (first_2 a) j) (<= j (last_2 a)))
  (=> (and (<= (first4 a) i) (<= i (last4 a)))
  (forall ((o2 Int))
  (=> (= (to_rep (get (to_array a) i j)) o2)
  (let ((o3 (f_2 o2 o1)))
  (=>
  (and (f_2__function_guard o3 o2 o1) (dynamic_invariant o3 true false true
  true))
  (<= (first_2
      (of_array (to_array a) (first4 a) (last4 a) (first_2 a) (last_2 a))) o))))))))))))))))))))))))
(check-sat)
(exit)
