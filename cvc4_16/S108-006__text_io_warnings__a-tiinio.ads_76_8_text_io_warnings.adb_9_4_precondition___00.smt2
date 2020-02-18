;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((file_type__ref 0))
(((file_type__refqtmk (file_type__content us_rep)))))
(define-fun file_type__ref_file_type__content__projection ((a file_type__ref)) us_rep 
  (file_type__content a))

(declare-fun is_open (us_rep) Bool)

(declare-fun is_open__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_207 us_rep)
  (temp___skip_top_level_208 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_208 true))
                                         (not
                                         (= (is_open temp___expr_207) true))))

;; is_open__post_axiom
  (assert true)

(declare-fun mode (us_rep) Int)

(declare-fun mode__function_guard (Int us_rep) Bool)

(declare-sort file_mode 0)

(define-fun pos_to_rep ((x Int)) Int (ite (= x 2) 3 (ite (= x 1) 2 0)))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq1 (file_mode file_mode) Bool)

(declare-const dummy1 file_mode)

(declare-datatypes ((file_mode__ref 0))
(((file_mode__refqtmk (file_mode__content file_mode)))))
(define-fun file_mode__ref_file_mode__content__projection ((a file_mode__ref)) file_mode 
  (file_mode__content a))

(define-fun dynamic_invariant ((temp___expr_242 Int)
  (temp___is_init_238 Bool) (temp___skip_constant_239 Bool)
  (temp___do_toplevel_240 Bool)
  (temp___do_typ_inv_241 Bool)) Bool (=>
                                     (or (= temp___is_init_238 true)
                                     (<= 0 2)) (in_range temp___expr_242)))

;; mode__post_axiom
  (assert
  (forall ((file us_rep))
  (! (=> (= (is_open file) true) (dynamic_invariant (mode file) true false
     true true)) :pattern ((mode file)) )))

(declare-const file us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const item Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const width Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const base Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun line_length (us_rep us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_rep us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (count count) Bool)

(declare-const dummy2 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant1 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_178)))

;; line_length__post_axiom
  (assert
  (forall ((file1 us_rep))
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_err us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private))
  (! (=> (and (= (is_open file1) true) (not (= (mode file1) 0)))
     (dynamic_invariant1
     (line_length file1 ada___ada__text_io__standard_in
     ada___ada__text_io__standard_out ada___ada__text_io__standard_err
     ada___ada__text_io__current_err ada___ada__text_io__file_system
     ada___ada__text_io__current_in ada___ada__text_io__current_out) true
     false true true)) :pattern ((line_length file1
                                 ada___ada__text_io__standard_in
                                 ada___ada__text_io__standard_out
                                 ada___ada__text_io__standard_err
                                 ada___ada__text_io__current_err
                                 ada___ada__text_io__file_system
                                 ada___ada__text_io__current_in
                                 ada___ada__text_io__current_out)) ))))

(declare-fun page_length (us_rep us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_rep us_private us_private
  us_private us_private us_private us_private us_private) Bool)

;; page_length__post_axiom
  (assert
  (forall ((file1 us_rep))
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_err us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private))
  (! (=> (and (= (is_open file1) true) (not (= (mode file1) 0)))
     (dynamic_invariant1
     (page_length file1 ada___ada__text_io__standard_in
     ada___ada__text_io__standard_out ada___ada__text_io__standard_err
     ada___ada__text_io__current_err ada___ada__text_io__file_system
     ada___ada__text_io__current_in ada___ada__text_io__current_out) true
     false true true)) :pattern ((page_length file1
                                 ada___ada__text_io__standard_in
                                 ada___ada__text_io__standard_out
                                 ada___ada__text_io__standard_err
                                 ada___ada__text_io__current_err
                                 ada___ada__text_io__file_system
                                 ada___ada__text_io__current_in
                                 ada___ada__text_io__current_out)) ))))

(declare-sort num 0)

(declare-fun numqtint (num) Int)

;; num'axiom
  (assert
  (forall ((i num)) (and (<= (- 20) (numqtint i)) (<= (numqtint i) 20))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 20) x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (num num) Bool)

(declare-const dummy3 num)

(declare-datatypes ((num__ref 0))
(((num__refqtmk (num__content num)))))
(define-fun num__ref_num__content__projection ((a num__ref)) num (num__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_221 Int)
  (temp___is_init_217 Bool) (temp___skip_constant_218 Bool)
  (temp___do_toplevel_219 Bool)
  (temp___do_typ_inv_220 Bool)) Bool (=>
                                     (or (= temp___is_init_217 true)
                                     (<= (- 20) 20)) (in_range2
                                     temp___expr_221)))

(declare-sort field 0)

(declare-fun fieldqtint (field) Int)

;; field'axiom
  (assert
  (forall ((i field)) (and (<= 0 (fieldqtint i)) (<= (fieldqtint i) 255))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (field field) Bool)

(declare-const dummy4 field)

(declare-datatypes ((field__ref 0))
(((field__refqtmk (field__content field)))))
(define-fun field__ref_field__content__projection ((a field__ref)) field 
  (field__content a))

(define-fun dynamic_invariant3 ((temp___expr_228 Int)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (<= 0 255)) (in_range3 temp___expr_228)))

(declare-sort number_base 0)

(declare-fun number_baseqtint (number_base) Int)

;; number_base'axiom
  (assert
  (forall ((i number_base))
  (and (<= 2 (number_baseqtint i)) (<= (number_baseqtint i) 16))))

(define-fun in_range4 ((x Int)) Bool (and (<= 2 x) (<= x 16)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (number_base number_base) Bool)

(declare-const dummy5 number_base)

(declare-datatypes ((number_base__ref 0))
(((number_base__refqtmk (number_base__content number_base)))))
(define-fun number_base__ref_number_base__content__projection ((a number_base__ref)) number_base 
  (number_base__content a))

(define-fun dynamic_invariant4 ((temp___expr_235 Int)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=>
                                     (or (= temp___is_init_231 true)
                                     (<= 2 16)) (in_range4 temp___expr_235)))

(assert
;; defqtvc
 ;; File "a-tiinio.ads", line 68, characters 0-0
  (not
  (=> (dynamic_invariant2 item true false true true)
  (=> (dynamic_invariant3 width true false true true)
  (=> (dynamic_invariant4 base true false true true)
  (=> (= (is_open file) true)
  (=> (not (= (mode file) 0)) (= (is_open file) true))))))))
(check-sat)