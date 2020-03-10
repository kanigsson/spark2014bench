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

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= 0 (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (element element) Bool)

(declare-const dummy element)

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun to_rep ((x element)) Int (elementqtint x))

(declare-fun of_rep (Int) element)

;; inversion_axiom
  (assert
  (forall ((x element)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x element)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element))))))
(declare-fun slide ((Array Int element) Int Int) (Array Int element))

;; slide_eq
  (assert
  (forall ((a (Array Int element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element)) (a__first Int) (a__last Int)
  (b (Array Int element)) (b__first Int)
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
  (forall ((a (Array Int element)) (b (Array Int element)))
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

(declare-const dummy1 (Array Int element))

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

(declare-fun user_eq1 ((Array Int element) (Array Int element)) Bool)

(declare-sort less_than_max 0)

(declare-fun less_than_maxqtint (less_than_max) Int)

;; less_than_max'axiom
  (assert
  (forall ((i less_than_max))
  (and (<= 0 (less_than_maxqtint i)) (<= (less_than_maxqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (less_than_max less_than_max) Bool)

(declare-const dummy2 less_than_max)

(declare-datatypes ((less_than_max__ref 0))
(((less_than_max__refqtmk (less_than_max__content less_than_max)))))
(define-fun less_than_max__ref_less_than_max__content__projection ((a less_than_max__ref)) less_than_max 
  (less_than_max__content a))

(define-fun to_rep1 ((x less_than_max)) Int (less_than_maxqtint x))

(declare-fun of_rep1 (Int) less_than_max)

;; inversion_axiom
  (assert
  (forall ((x less_than_max))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x less_than_max)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stacks__stack_root__content (Array Int element))(rec__stacks__stack_root__length less_than_max)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__stacks__stack_root__content__projection ((a us_split_fields)) (Array Int element) 
  (rec__stacks__stack_root__content a))

(define-fun us_split_fields_rec__stacks__stack_root__length__projection ((a us_split_fields)) less_than_max 
  (rec__stacks__stack_root__length a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__stacks__stack_root__content
                           (us_split_fields1 a)) 1 100
                           (rec__stacks__stack_root__content
                           (us_split_fields1 b)) 1 100) true)
                        (= (to_rep1
                           (rec__stacks__stack_root__length
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__stacks__stack_root__length
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stacks__stack_root__content__first__bit Int)

(declare-const stacks__stack_root__content__last__bit Int)

(declare-const stacks__stack_root__content__position Int)

;; stacks__stack_root__content__first__bit_axiom
  (assert (<= 0 stacks__stack_root__content__first__bit))

;; stacks__stack_root__content__last__bit_axiom
  (assert
  (< stacks__stack_root__content__first__bit stacks__stack_root__content__last__bit))

;; stacks__stack_root__content__position_axiom
  (assert (<= 0 stacks__stack_root__content__position))

(declare-const stacks__stack_root__length__first__bit Int)

(declare-const stacks__stack_root__length__last__bit Int)

(declare-const stacks__stack_root__length__position Int)

;; stacks__stack_root__length__first__bit_axiom
  (assert (<= 0 stacks__stack_root__length__first__bit))

;; stacks__stack_root__length__last__bit_axiom
  (assert
  (< stacks__stack_root__length__first__bit stacks__stack_root__length__last__bit))

;; stacks__stack_root__length__position_axiom
  (assert (<= 0 stacks__stack_root__length__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack_root__ref 0))
(((stack_root__refqtmk (stack_root__content us_rep)))))
(define-fun stack_root__ref_stack_root__content__projection ((a stack_root__ref)) us_rep 
  (stack_root__content a))

(declare-const s__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

(declare-fun temp_____aggregate_def_192 (Int) (Array Int element))

;; temp___result_197'def
  (assert
  (forall ((temp___196 us_rep)) (size__function_guard (size temp___196)
  temp___196)))

(define-fun default_initial_assumption ((temp___expr_190 us_rep)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (and
                                         (= (attr__tag temp___expr_190) 
                                         us_tag)
                                         (and
                                         (= (rec__stacks__stack_root__content
                                            (us_split_fields1
                                            temp___expr_190)) (temp_____aggregate_def_192
                                                              0))
                                         (= (to_rep1
                                            (rec__stacks__stack_root__length
                                            (us_split_fields1
                                            temp___expr_190))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_191 true))
                                         (= (size temp___expr_190) 0))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (= (is_empty s) true) (= (size s) 0))) :pattern ((is_empty s)) )))

(declare-fun reset__specific_post (Int us_split_fields Int
  us_split_fields) Bool)

;; stacks__stack_root__compat_axiom
  (assert
  (forall ((stacks__reset__s__fields us_split_fields)
  (stacks__reset__s__old__fields us_split_fields))
  (forall ((s__attr__tag1 Int))
  (! (=> (reset__specific_post us_tag stacks__reset__s__fields s__attr__tag1
     stacks__reset__s__old__fields)
     (and
     (forall ((stacks__reset__s__fields1 us_split_fields)
     (s__attr__tag2 Int)) (is_empty__function_guard
     (is_empty (us_repqtmk stacks__reset__s__fields1 s__attr__tag2))
     (us_repqtmk stacks__reset__s__fields1 s__attr__tag2)))
     (= (is_empty (us_repqtmk stacks__reset__s__fields s__attr__tag1)) true))) :pattern ((reset__specific_post
  us_tag stacks__reset__s__fields s__attr__tag1
  stacks__reset__s__old__fields)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq5 (positive positive) Bool)

(declare-const dummy5 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int element))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element) (elts a))

(define-fun of_array ((a (Array Int element)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq6 (us_t us_t) Bool)

(declare-const dummy6 us_t)

(declare-datatypes ((model__ref 0))
(((model__refqtmk (model__content us_t)))))
(define-fun model__ref_model__content__projection ((a model__ref)) us_t 
  (model__content a))

(declare-fun get_model (us_rep) us_t)

(declare-fun get_model__function_guard (us_t us_rep) Bool)

(declare-fun get_model1 (Int us_rep) us_t)

(declare-fun get_model__function_guard1 (us_t Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_224 us_t)
  (temp___is_init_220 Bool) (temp___skip_constant_221 Bool)
  (temp___do_toplevel_222 Bool)
  (temp___do_typ_inv_223 Bool)) Bool (=>
                                     (not (= temp___skip_constant_221 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_224)
                                     (last1 temp___expr_224))))

;; get_model__post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (get_model s)))
     (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (=> (get_model__function_guard result s)
     (and
     (and (and (in_range1 (first1 result)) (in_range1 (last1 result)))
     (= (length result) (size s))) (dynamic_invariant result true false true
     true))))) :pattern ((get_model s)) )))

;; get_model__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((s us_rep))
  (! (let ((result (get_model1 attr__tag1 s)))
     (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (=> (get_model__function_guard1 result attr__tag1 s)
     (and
     (and (and (in_range1 (first1 result)) (in_range1 (last1 result)))
     (= (length result) (size s))) (dynamic_invariant result true false true
     true))))) :pattern ((get_model1 attr__tag1 s)) ))))

;; stacks__stack_root__compat_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (get_model__function_guard1 (get_model1 us_tag s) us_tag s)
     (and
     (forall ((s1 us_rep)) (get_model__function_guard (get_model s1) s1))
     (= (get_model s) (get_model1 us_tag s)))) :pattern ((get_model1 
                                                         us_tag s)) )))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

(declare-fun concat1 ((Array Int element) Int Int (Array Int element) Int
  Int) (Array Int element))

;; concat_def
  (assert
  (forall ((a (Array Int element)) (b (Array Int element)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (element Int (Array Int element) Int
  Int) (Array Int element))

;; concat_singleton_left_def
  (assert
  (forall ((a element))
  (forall ((b (Array Int element)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int element) Int Int
  element) (Array Int element))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((b element))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (element Int element) (Array Int element))

;; concat_singletons_def
  (assert
  (forall ((a element) (b element))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (element Int) (Array Int element))

;; singleton_def
  (assert
  (forall ((v element))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-fun push__specific_post (Int us_split_fields Int Int
  us_split_fields) Bool)

;; stacks__stack_root__compat_axiom
  (assert
  (forall ((stacks__push__s__fields us_split_fields)
  (stacks__push__s__old__fields us_split_fields))
  (forall ((s__attr__tag1 Int) (e Int))
  (! (=> (push__specific_post us_tag stacks__push__s__fields s__attr__tag1 e
     stacks__push__s__old__fields)
     (and
     (forall ((stacks__push__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__push__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__push__s__old__fields1 s__attr__tag2)))
     (let ((temp___old_263 (get_model
                           (us_repqtmk stacks__push__s__old__fields
                           s__attr__tag1))))
     (and
     (forall ((stacks__push__s__fields1 us_split_fields) (s__attr__tag2 Int))
     (get_model__function_guard
     (get_model (us_repqtmk stacks__push__s__fields1 s__attr__tag2))
     (us_repqtmk stacks__push__s__fields1 s__attr__tag2)))
     (= (let ((temp___267 (ite (= (length temp___old_263) 0)
                          (of_array (singleton1 (of_rep e) 1) 1 1)
                          (of_array
                          (concat_singleton_right (to_array temp___old_263)
                          (first1 temp___old_263) (last1 temp___old_263)
                          (of_rep e)) (first1 temp___old_263)
                          (- (+ (first1 temp___old_263) (+ (length1
                                                           (first1
                                                           temp___old_263)
                                                           (last1
                                                           temp___old_263)) 1)) 1)))))
        (let ((temp___266 (get_model
                          (us_repqtmk stacks__push__s__fields s__attr__tag1))))
        (bool_eq (to_array temp___266) (first1 temp___266) (last1 temp___266)
        (to_array temp___267) (first1 temp___267) (last1 temp___267)))) true))))) :pattern ((push__specific_post
  us_tag stacks__push__s__fields s__attr__tag1 e
  stacks__push__s__old__fields)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_164)))

(declare-datatypes ((t14s__ref 0))
(((t14s__refqtmk (t14s__content us_t)))))
(define-fun t14s__ref_t14s__content__projection ((a t14s__ref)) us_t 
  (t14s__content a))

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_t)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_t (t5b__content
                                                                  a))

(declare-fun pop__specific_post (Int us_split_fields Int Int us_split_fields
  Int) Bool)

;; stacks__stack_root__compat_axiom
  (assert
  (forall ((stacks__pop__s__fields us_split_fields)
  (stacks__pop__s__old__fields us_split_fields))
  (forall ((s__attr__tag1 Int) (stacks__pop__e Int)
  (stacks__pop__e__old Int))
  (! (=> (pop__specific_post us_tag stacks__pop__s__fields s__attr__tag1
     stacks__pop__e stacks__pop__s__old__fields stacks__pop__e__old)
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (is_empty__function_guard
     (is_empty (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (forall ((stacks__pop__s__old__fields1 us_split_fields)
     (s__attr__tag2 Int)) (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__old__fields1 s__attr__tag2)))
     (and
     (and
     (forall ((stacks__pop__s__fields1 us_split_fields) (s__attr__tag2 Int))
     (get_model__function_guard
     (get_model (us_repqtmk stacks__pop__s__fields1 s__attr__tag2))
     (us_repqtmk stacks__pop__s__fields1 s__attr__tag2)))
     (= (let ((temp___313 (let ((temp___308 (- (last1
                                               (get_model
                                               (us_repqtmk
                                               stacks__pop__s__old__fields
                                               s__attr__tag1))) 1)))
                          (let ((temp___306 (first1
                                            (get_model
                                            (us_repqtmk
                                            stacks__pop__s__old__fields
                                            s__attr__tag1)))))
                          (of_array
                          (to_array
                          (get_model
                          (us_repqtmk stacks__pop__s__old__fields
                          s__attr__tag1))) temp___306 temp___308)))))
        (let ((temp___312 (get_model
                          (us_repqtmk stacks__pop__s__fields s__attr__tag1))))
        (bool_eq (to_array temp___312) (first1 temp___312) (last1 temp___312)
        (to_array temp___313) (first1 temp___313) (last1 temp___313)))) true))
     (=>
     (not
     (= (is_empty (us_repqtmk stacks__pop__s__old__fields s__attr__tag1)) true))
     (= stacks__pop__e (to_rep
                       (select (to_array
                               (get_model
                               (us_repqtmk stacks__pop__s__old__fields
                               s__attr__tag1))) (last1
                                                (get_model
                                                (us_repqtmk
                                                stacks__pop__s__old__fields
                                                s__attr__tag1))))))))))))))) :pattern ((pop__specific_post
  us_tag stacks__pop__s__fields s__attr__tag1 stacks__pop__e
  stacks__pop__s__old__fields stacks__pop__e__old)) ))))

(declare-sort t2b 0)

(declare-fun t2bqtint (t2b) Int)

;; t2b'axiom
  (assert (forall ((i t2b)) (and (<= 1 (t2bqtint i)) (<= (t2bqtint i) 5))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (t2b t2b) Bool)

(declare-const dummy7 t2b)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content t2b)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) t2b (t2b__content
                                                                 a))

(declare-fun temp_____aggregate_def_349 (Int Int Int Int
  Int) (Array Int element))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-const rliteral element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral) 1))

(declare-const rliteral1 element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral1) 2))

(declare-const rliteral2 element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral2) 3))

(declare-const rliteral3 element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral3) 4))

(declare-const rliteral4 element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral4) 5))

;; def_axiom
  (assert
  (forall ((temp___351 Int) (temp___352 Int) (temp___353 Int)
  (temp___354 Int) (temp___355 Int))
  (let ((temp___350 (temp_____aggregate_def_349 temp___351 temp___352
                    temp___353 temp___354 temp___355)))
  (=>
  (and
  (and (dynamic_invariant1 temp___351 true true true true)
  (dynamic_invariant1 temp___352 true true true true))
  (and
  (and (dynamic_invariant1 temp___353 true true true true)
  (dynamic_invariant1 temp___354 true true true true)) (dynamic_invariant1
  temp___355 true true true true)))
  (and
  (and (= (select temp___350 1) rliteral)
  (= (select temp___350 2) rliteral1))
  (and
  (and (= (select temp___350 3) rliteral2)
  (= (select temp___350 4) rliteral3)) (= (select temp___350 5) rliteral4)))))))

(define-fun dynamic_invariant4 ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 0 100)) (in_range1 temp___expr_181)))

;; size__post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (size s)))
     (=> (size__function_guard result s) (dynamic_invariant4 result true
     false true true))) :pattern ((size s)) )))

;; size__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (size s) (to_rep1
                 (rec__stacks__stack_root__length (us_split_fields1 s)))) :pattern (
  (size s)) )))

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (= (is_full s) true) (= (size s) 100))) :pattern ((is_full s)) )))

(declare-const rliteral5 element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral5) 0))

;; def_axiom
  (assert
  (forall ((temp___194 Int))
  (=> (dynamic_invariant1 temp___194 true true true true)
  (forall ((temp___195 Int))
  (= (select (temp_____aggregate_def_192 temp___194) temp___195) rliteral5)))))

(assert
;; defqtvc
 ;; File "test_stack.adb", line 2, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields) (e Int))
  (=> (dynamic_invariant1 e false false true true)
  (let ((o s__attr__tag))
  (forall ((s__split_fields1 us_split_fields))
  (=>
  (forall ((o1 Int) (s__split_fields2 us_split_fields))
  (is_empty__function_guard (is_empty (us_repqtmk s__split_fields2 o1))
  (us_repqtmk s__split_fields2 o1)))
  (=>
  (and (= (is_empty (us_repqtmk s__split_fields1 o)) true)
  (reset__specific_post o s__split_fields1 o s__split_fields))
  (forall ((i Int))
  (=> (= i 1)
  (=>
  (forall ((s__split_fields2 us_split_fields) (o1 Int))
  (is_full__function_guard (is_full (us_repqtmk s__split_fields2 o1))
  (us_repqtmk s__split_fields2 o1)))
  (not (= (is_full (us_repqtmk s__split_fields1 s__attr__tag)) true)))))))))))))
(check-sat)
(exit)
